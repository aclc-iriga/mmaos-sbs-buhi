<?php
    if(!defined('EVENT_SLUGS'))
        exit();

    const LOGIN_PAGE_PATH = '../../crud/';
    require_once '../../crud/auth.php';

    require_once '../../config/database.php';
    require_once '../../models/Admin.php';
    require_once '../../models/Team.php';
    require_once '../../models/Event.php';

    // initialize titles
    $titles_1 = ['JHS 1', 'JHS 2'];
    $titles_2 = ['SHS 1', 'SHS 2'];
    $titles   = array_merge($titles_1, $titles_2);

    // initialize admin
    $admin = new Admin();

    // initialize events and tabulate results
    $events  = [];
    $results = [];
    $category_title = '';
    $teams      = [];
    $judges     = [];
    $technicals = [];
    for($i=0; $i<sizeof(EVENT_SLUGS); $i++) {
        $events[]  = Event::findBySlug(EVENT_SLUGS[$i]);
        $results[] = $admin->tabulate($events[$i]);

        if($i == 0) {
            $category_title = $events[$i]->getCategory()->getTitle();
            $teams      = $events[$i]->getAllTeams();
            $judges     = $events[$i]->getAllJudges();
            $technicals = $events[$i]->getAllTechnicals();
        }
    }

    // process result
    $result = [];
    $unique_total_ranks    = [];
    $unique_adjusted_ranks = [];
    foreach($teams as $team) {
        $team_key = 'team_'.$team->getId();

        $t = [
            'info'    => $team->toArray(),
            'inputs'  => [],
            'average' => 0,
            'rank'    => [
                'total'    => 0,
                'average'  => 0,
                'dense'    => 0,
                'initial'  => 0,
                'adjusted' => 0,
                'final' => [
                    'dense'      => 0,
                    'fractional' => 0
                ]
            ],
            'title' => ''
        ];

        // get rank and average
        for($i=0; $i<sizeof($events); $i++) {
            $r = [
                'rank'    => 0,
                'average' => 0,
            ];

            if(isset($results[$i]['teams'][$team_key])) {
                $r['rank']    = $results[$i]['teams'][$team_key]['rank']['final']['fractional'];
                $r['average'] = $results[$i]['teams'][$team_key]['ratings']['average'];
            }

            // append $r to $t['inputs']
            $t['inputs'][EVENT_SLUGS[$i]] = $r;

            // accumulate totals
            $t['average'] += $r['average'];
            $t['rank']['total']   += $r['rank'];
            $t['rank']['average'] += $r['rank'];
        }

        // complete $t['average'] and $t['rank']['average']
        $t['average'] /= sizeof($events);
        $t['rank']['average'] /= sizeof($events);


        // push $t['rank']['total'] to $unique_total_ranks
        if(!in_array($t['rank']['total'], $unique_total_ranks))
            $unique_total_ranks[] = $t['rank']['total'];

        // append $t to $result
        $result[$team_key] = $t;
    }

    // sort $unique_total_ranks
    sort($unique_total_ranks);

    // gather $rank_group (for getting fractional rank)
    $rank_group = [];
    foreach($result as $team_key => $team) {
        // get dense rank
        $dense_rank = 1 + array_search($team['rank']['total'], $unique_total_ranks);
        $result[$team_key]['rank']['dense'] = $dense_rank;

        // push $team_key to $rank_group
        $key_rank = 'rank_' . $dense_rank;
        if(!isset($rank_group[$key_rank]))
            $rank_group[$key_rank] = [];
        $rank_group[$key_rank][] = $team_key;
    }

    // get initial fractional rank
    $ctr = 0;
    for($i = 0; $i < sizeof($unique_total_ranks); $i++) {
        $key = 'rank_' . ($i + 1);
        $group = $rank_group[$key];
        $size = sizeof($group);
        $initial_rank = $ctr + ((($size * ($size + 1)) / 2) / $size);

        // write $fractional_rank to $group members
        for($j = 0; $j < $size; $j++) {
            $result[$group[$j]]['rank']['initial'] = $initial_rank;

            // compute adjusted average
            $adjusted_rank = $initial_rank - ($result[$group[$j]]['average'] * 0.01);
            $result[$group[$j]]['rank']['adjusted'] = $adjusted_rank;

            // push to $unique_adjusted_ranks
            if(!in_array($adjusted_rank, $unique_adjusted_ranks))
                $unique_adjusted_ranks[] = $adjusted_rank;
        }

        $ctr += $size;
    }

    // sort $unique_adjusted_ranks
    sort($unique_adjusted_ranks);

    // gather $rank_group (for getting fractional rank)
    $rank_group = [];
    foreach($result as $team_key => $team) {
        // get dense rank
        $dense_rank = 1 + array_search($team['rank']['adjusted'], $unique_adjusted_ranks);
        $result[$team_key]['rank']['final']['dense'] = $dense_rank;

        // push $key to $rank_group
        $key_rank = 'rank_' . $dense_rank;
        if(!isset($rank_group[$key_rank]))
            $rank_group[$key_rank] = [];
        $rank_group[$key_rank][] = $team_key;
    }

    // get final fractional rank
    $unique_final_fractional_ranks = [];
    $ctr = 0;
    for($i = 0; $i < sizeof($unique_adjusted_ranks); $i++) {
        $key = 'rank_' . ($i + 1);
        $group = $rank_group[$key];
        $size = sizeof($group);
        $final_fractional_rank = $ctr + ((($size * ($size + 1)) / 2) / $size);

        // push to $unique_final_fractional_ranks
        if(!in_array($final_fractional_rank, $unique_final_fractional_ranks))
            $unique_final_fractional_ranks[] = $final_fractional_rank;

        // write $fractional_rank to $group members
        for($j = 0; $j < $size; $j++) {
            $result[$group[$j]]['rank']['final']['fractional'] = $final_fractional_rank;
        }

        $ctr += $size;
    }

    // sort $unique_final_fractional_ranks
    sort($unique_final_fractional_ranks);

    // determine tops
    $tops_ordered = [];

    // JHS tops
    $tops_1_count = 0;
    $titles_1_ctr = 0;
    for($i = 0; $i < sizeof($unique_final_fractional_ranks); $i++) {
        $has_winner = false;
        foreach($result as $team_key => $team) {
            if(strtoupper(trim($team['info']['location'])) === 'JHS') {
                if($team['rank']['final']['fractional'] == $unique_final_fractional_ranks[$i]) {
                    $has_winner = true;
                    $result[$team_key]['title'] = $titles_1[$titles_1_ctr];
                    $tops_ordered[] = $team['info']['id'];
                    $tops_1_count += 1;
                }
            }
        }
        if($has_winner) {
            $titles_1_ctr += 1;
        }
        if($tops_1_count >= sizeof($titles_1) || $titles_1_ctr >= sizeof($titles_1)) {
            break;
        }
    }

    // SHS tops
    $tops_2_count = 0;
    $titles_2_ctr = 0;
    for($i = 0; $i < sizeof($unique_final_fractional_ranks); $i++) {
        $has_winner = false;
        foreach($result as $team_key => $team) {
            if(strtoupper(trim($team['info']['location'])) === 'SHS') {
                if($team['rank']['final']['fractional'] == $unique_final_fractional_ranks[$i]) {
                    $has_winner = true;
                    $result[$team_key]['title'] = $titles_2[$titles_2_ctr];
                    $tops_ordered[] = $team['info']['id'];
                    $tops_2_count += 1;
                }
            }
        }
        if($has_winner) {
            $titles_2_ctr += 1;
        }
        if($tops_2_count >= sizeof($titles_2) || $titles_2_ctr >= sizeof($titles_2)) {
            break;
        }
    }

    // check if judges have unlocked ratings
    $judges_with_unlocked_ratings = [];
    foreach($judges as $judge) {
        $unlocked_events = [];
        foreach($events as $event) {
            if($judge->hasUnlockedRatings($event)) {
                $unlocked_events[] = $event->getTitle();
            }
        }
        if(!empty($unlocked_events)) {
            $unlocked_events = array_unique($unlocked_events);
            $judges_with_unlocked_ratings[] = [
                'name'   => $judge->getName(),
                'number' => $judge->getNumber(),
                'events' => implode(', ', $unlocked_events)
            ];
        }
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../../crud/dist/bootstrap-5.2.3/css/bootstrap.min.css">
    <style>
        th, td {
            vertical-align: middle;
        },
        .bt {
            border-top: 2px solid #aaa !important;
        }
        .br {
            border-right: 2px solid #aaa !important;
        }
        .bb, table.result tbody tr:last-child td {
            border-bottom: 2px solid #aaa !important;
        }
        .bl {
            border-left: 2px solid #aaa !important;
        }
        @media print {
            .note {
                display: none;
            }
        }
    </style>
    <title>Top <?= sizeof($titles) + 1 ?> | <?= $category_title ?></title>
</head>
<body>
    <?php if (!empty($judges_with_unlocked_ratings)) { ?>
        <div class="alert alert-danger text-center mb-0">
            <h5><i class="fas fa-exclamation-triangle me-2"></i>Warning: The following judges have unlocked ratings:</h5>
            <div class="d-flex flex-row justify-content-center">
                <img src="../../crud/uploads/ramona.jpg" alt="Warning" style="height: 200px; padding-right: 10px; align-self: flex-end">
                <ul class="list-unstyled mb-0">
                    <?php foreach ($judges_with_unlocked_ratings as $judgeInfo) { ?>
                        <li style="font-weight: bolder !important; font-size: larger">
                            <?= $judgeInfo['name'] ?> (Judge <?= $judgeInfo['number'] ?>) - Events: <?= $judgeInfo['events'] ?>
                        </li>
                    <?php } ?>
                </ul>
            </div>
            <p class="mt-2">Please make sure the ratings are all locked before finalizing results.</p>
        </div>
    <?php } ?>
    <table class="table table-bordered result">
        <thead>
            <tr class="table-secondary">
                <th colspan="3" rowspan="2" class="text-center bt br bl">
                    <h1 class="m-0">TOP <?= sizeof($titles) + 1 ?></h1>
                    <h5><?= $category_title ?></h5>
                </th>
                <?php for($i=0; $i<sizeof($events); $i++) { ?>
                    <th colspan="2" class="text-center text-success bt br" style="width: 11%">
                        <?= $events[$i]->getTitle() ?>
                    </th>
                <?php } ?>
                <th rowspan="2" class="text-center bl bt br">
                    <span class="opacity-75">GEN.<br>AVG.</span>
                </th>
                <th rowspan="2" class="text-center text-primary bl bt br">
                    <span class="opacity-75">RANK<br>TOTAL</span>
                </th>
                <th rowspan="2" class="text-center text-primary bl bt br">
                    <span class="opacity-75">RANK<br>AVG.</span>
                </th>
                <th rowspan="2" class="text-center bl bt br">
                    <span class="opacity-50">INITIAL<br>RANK</span>
                </th>
                <th rowspan="2" class="text-center bl bt br">
                    FINAL<br>RANK
                </th>
                <th rowspan="2" class="text-center bl bt br">
                    SLOT
                </th>
            </tr>
            <tr class="table-secondary">
                <?php for($i=0; $i<sizeof($events); $i++) { ?>
                    <th class="text-center bl"><span class="opacity-75">Avg.</span></th>
                    <th class="text-center text-primary br">Rank</th>
                <?php } ?>
            </tr>
        </thead>

        <tbody>
        <?php
        foreach($result as $team_key => $team) { ?>
            <tr data-team-id="<?= $team['info']['id'] ?>"<?= $team['title'] !== '' ? ' class="table-warning"' : '' ?>>
                <!-- number -->
                <td class="pe-3 fw-bold bl td-number" align="right" style="cursor: pointer; user-select: none">
                    <h4 class="team-number m-0">
                        <?= $team['info']['number'] ?>
                    </h4>
                </td>

                <!-- avatar -->
                <td style="width: 64px;" align="center">
                    <img
                        class="team-avatar"
                        src="../../crud/uploads/<?= $team['info']['avatar'] ?>"
                        alt="<?= $team['info']['number'] ?>"
                        style="width: 64px; border-radius: 100%"
                    >
                </td>

                <!-- name -->
                <td class="br">
                    <h6 class="team-name text-uppercase m-0"><?= $team['info']['name'] ?></h6>
                    <small class="team-location m-0" data-location="<?= $team['info']['location'] ?>"><?= $team['info']['location'] ?></small>
                </td>

                <!-- averages -->
                <?php for($i=0; $i<sizeof($events); $i++) { ?>
                    <td class="pe-3 bl" align="right">
                        <span class="opacity-75">
                            <?= number_format($team['inputs'][EVENT_SLUGS[$i]]['average'], 2) ?>
                        </span>
                    </td>
                    <td class="pe-3 text-primary br" align="right">
                        <?= number_format($team['inputs'][EVENT_SLUGS[$i]]['rank'], 2) ?>
                    </td>
                <?php } ?>

                <!-- general average -->
                <td class="pe-3 bl br fw-bold" align="right">
                    <span class="opacity-75">
                        <?= number_format($team['average'], 2) ?>
                    </span>
                </td>

                <!-- rank total -->
                <td class="pe-3 text-primary fw-bold bl br fw-bold" align="right">
                    <span class="opacity-75"><?= number_format($team['rank']['total'], 2) ?></span>
                </td>

                <!-- rank average -->
                <td class="pe-3 text-primary fw-bold bl br fw-bold" align="right">
                    <span class="opacity-75"><?= number_format($team['rank']['average'], 2) ?></span>
                </td>

                <!-- initial rank -->
                <td class="pe-3 bl br fw-bold" align="right">
                    <span class="opacity-50"><?= number_format($team['rank']['initial'], 2) ?></span>
                </td>

                <!-- final rank -->
                <td class="pe-3 bl br fw-bold" align="right">
                    <?= number_format($team['rank']['final']['fractional'], 2) ?>
                </td>

                <!-- title -->
                <td class="bl br fw-bold" align="center" style="line-height: 1.1">
                    <h4 class="ma-0 team-title"><?= $team['title'] ?></h4>
                </td>
            </tr>
        <?php } ?>
        </tbody>
    </table>

    <!-- Note -->
    <h4 class="note px-3 text-danger"><b>NOTE:</b> Double-click on a candidate's number above to add or remove them from the TOP <?= sizeof($titles) + 1 ?>.</h4>

    <!-- Judges -->
    <div class="container-fluid">
        <div class="row justify-content-center">
            <?php foreach($judges as $judge) { ?>
                <div class="col-sm-3">
                    <div class="mt-5 pt-3 text-center">
                        <h6 class="mb-0"><?= $judge->getName() ?></h6>
                    </div>
                    <div class="text-center">
                        <p class="mb-0">
                            Judge <?= $judge->getNumber() ?>
                            <?php if($judge->isChairmanOfEvent($events[0])) { ?>
                                * (Chairman)
                            <?php } ?>
                        </p>
                    </div>
                </div>
            <?php } ?>
        </div>
    </div>

    <!-- Summary -->
    <div class="container-fluid mt-5" style="page-break-before: always;">
        <div class="row">
            <!-- ordered -->
            <div class="col-md-6 offset-md-3" align="center">
                <h4 class="opacity-75"><?= $category_title ?></h4>
                <h1>TOP <?= sizeof($titles) + 1 ?> (<?= ucfirst(rtrim(basename($_SERVER['PHP_SELF']), '.php')) ?>)</h1>
                <div style="width: 80%;">
                    <table class="table table-bordered mt-3 ordered-winners">
                        <tbody>
                        <?php
                        foreach($tops_ordered as $team_id) {
                            $team = $result['team_'.$team_id];
                        ?>
                            <tr data-team-id="<?= $team_id ?>">
                                <!-- number -->
                                <td class="pe-3 fw-bold text-center">
                                    <h3 class="m-0">
                                        <?= $team['info']['number'] ?>
                                    </h3>
                                </td>

                                <!-- avatar -->
                                <td style="width: 72px;">
                                    <img
                                        src="../../crud/uploads/<?= $team['info']['avatar'] ?>"
                                        alt="<?= $team['info']['number'] ?>"
                                        style="width: 100%; border-radius: 100%"
                                    >
                                </td>

                                <!-- name -->
                                <td>
                                    <h6 class="text-uppercase m-0"><?= $team['info']['name'] ?></h6>
                                    <small class="m-0"><?= $team['info']['location'] ?></small>
                                </td>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="../../crud/dist/jquery-3.6.4/jquery-3.6.4.min.js"></script>
    <script src="../../crud/dist/bootstrap-5.2.3/js/bootstrap.bundle.min.js"></script>
    <script>
        $(function() {
            const tableResult  = $('table.result');
            const tableWinners = $('table.ordered-winners');

            tableResult.find('tbody .td-number').on('dblclick', function() {
                const tr1 = $(this).parent();
                const teamTitleElement = tr1.find('.team-title');
                let   teamHasTitle = false;
                if(teamTitleElement.length > 0) {
                    teamHasTitle = teamTitleElement.text().trim() !== '';
                }
                if(tr1.hasClass('table-warning')) {
                    if(confirm(`Are you sure to  REMOVE #${$(this).text().trim()}  from the TOP <?= sizeof($titles) + 1 ?>?`)) {
                        const teamLocation = tr1.find('.team-location');
                        teamLocation.html(`${teamLocation.attr('data-location')}`);
                        tr1.removeClass('table-warning');
                        tableWinners.find(`tbody tr[data-team-id="${tr1.attr('data-team-id')}"]`).remove();
                    }
                }
                else {
                    if(confirm(`Are you sure to  ADD #${$(this).text().trim()}  to the TOP <?= sizeof($titles) + 1 ?>${!teamHasTitle ? '  as the PEOPLE\'S CHOICE' : '?'}`)) {
                        if(!teamHasTitle) {
                            const teamLocation = tr1.find('.team-location');
                            teamLocation.html(`${teamLocation.attr('data-location')} <b class="label text-success">(PEOPLE'S CHOICE)</b>`);
                        }
                        tr1.addClass('table-warning');
                        const trWinner = `
                            <tr data-team-id="${tr1.attr('data-team-id')}">
                                <td class="pe-3 fw-bold text-center">
                                    <h3 class="m-0">
                                        ${tr1.find('.team-number').text()}
                                    </h3>
                                </td>
                                <td style="width: 72px;">
                                    <img src="${tr1.find('.team-avatar').attr('src')}" alt="5" style="width: 100%; border-radius: 100%">
                                </td>
                                <td>
                                    <h6 class="text-uppercase m-0">${tr1.find('.team-name').text()}</h6>
                                    <small class="m-0">${tr1.find('.team-location').html()}</small>
                                </td>
                            </tr>
                        `;
                        tableWinners.find('tbody').append(trWinner);
                    }
                }
            });
        });
    </script>
</body>
</html>