($dahai_diff + $reach_decision) |
group_by(.id) |
map(add) |
[
    .[] | 
    {
        id,
        name,
        dahai_match_rate: (
            ((.dahai_choice_count.sum - .dahai_diff_count.sum) / .dahai_choice_count.sum)
        ),
        reach_decision_match_rate:
            (
                if .reach_decision_count.sum == 0 then
                    1
                else
                    (.reach_decision_match_count.sum / .reach_decision_count.sum)
                end
            ),
        total_match_rate: (
            ((.dahai_choice_count.sum - .dahai_diff_count.sum) + .reach_decision_match_count.sum) /
            (.dahai_choice_count.sum + .reach_decision_count.sum)
        )
    }
]
