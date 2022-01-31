{ name } +
# calculate coincidence rate
(
    1 - (
        (.dahai_diff | add) / (.dahai_choice | add)
    ) |
    { dahai_match: . }
)
