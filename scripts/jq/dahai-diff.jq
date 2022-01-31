[
# extract dahai choice
    [.[] |
        # fileter by event type
        [.[].info.msg | select(.type == "tsumo" or .type == "pon" or .type == "chi")] |
        # filter by player number
        map(select(.actor == $player)) |
        # when tsumo-agari happens, real_dahai is null
        map(select(.real_dahai != null)) |
        # when reached is true, no choice happen
        map(select(.reached == false))
    ] |
    (
        # count dahai choice
        map(length),
        # count dahai diff
        [.[] |
            map(select(.real_dahai != .pred_dahai)) |
            length
        ]
    )
]
| {
    name: $name,
    dahai_choice: .[0],
    dahai_diff: .[1]
}
