printjson(db.people.aggregate(
    [
        {
            $match: {
                sex: "Female",
                nationality: "Poland"
            }
        },
        {
            $unwind: "$credit"
        },
        {
            $group:
            {
                _id: "$credit.currency",
                sumBalance: { $sum: "$credit.balance"},
                avgBalance: { $avg: "$credit.balance"}
            }
        }
    ]
).toArray())