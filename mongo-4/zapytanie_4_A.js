
printjson(db.people.aggregate(
    [
        {
            $addFields:
            {
                heightPow: {$pow: ['$height',2]},
            }
        },
        {
            $addFields:
            {
                bmi: {$divide: ['$weight','$heightPow']}
            }
        },
        {
            $group:
            {
                _id: "$nationality",
                bmi: {
                    $avg: "$bmi"
                }
            }
        }
    ]
).toArray())