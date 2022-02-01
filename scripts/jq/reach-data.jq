[
    .[] as $kyoku |
    $kyoku |
    map(.info.msg.actor == $player and .reach != null) |
    indices(true) |
    map([.,.+1]) |
    map(map($kyoku[.])) |
    map([.[0].reach,.[1].info.msg.type == "reach"])
] |
{
    "id": $player,
    "name": $name,
    "reach_decision": .
}
