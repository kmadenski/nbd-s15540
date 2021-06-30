//aggs
//1
db.people.find().forEach(function(doc){
    doc.weight = parseFloat(doc.weight)
    doc.height = parseFloat(doc.height)
    db.people.save(doc)
})

printjson(db.people.aggregate(
    [
        {
            "$group":
            {
                _id: "$sex",
                avgWeight: { $avg: "$weight"},
                avgHeight: { $avg: "$height"}
            }
        }
    ]
).toArray())