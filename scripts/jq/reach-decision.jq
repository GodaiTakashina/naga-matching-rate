.id as $id |
.name as $name |
.reach_decision |
[
    (map(length)),
    (map(map(select((.[0] >= 5000 and .[1] == true) or (.[0] < 5000 and .[1] == false))) | length)),
    (map(map(select(.[0] >= 5000 and .[1] == false)) | length)),
    (map(map(select(.[0] < 5000 and .[1] == true)) | length))
] |
{
    "id": $id,
    "name": $name,
    "reach_decision_count": .[0] | {sum: (. | add), each_kyoku: .},
    "reach_decision_match_count":          .[1] | {sum: (. | add), each_kyoku: .},
    "bad_dama_count":       .[2] | {sum: (. | add), each_kyoku: .},
    "bad_reach_count":      .[3] | {sum: (. | add), each_kyoku: .}
}
