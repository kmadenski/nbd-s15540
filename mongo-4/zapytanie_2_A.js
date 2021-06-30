

printjson(db.people.aggregate(
    [
        {
            $unwind: "$credit"
        },
        {
            $group:
            {
                _id: "$credit.currency",
                sumBalance: { $sum: "$credit.balance"}
            }
        }
    ]
).toArray())