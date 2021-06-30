var items = db.people.aggregate([
    {
      $set: {
        height_num: {
          $convert: {
            input: "$height",
            to: "double"
          }
        }
      }
    },
    {$match: {height_num: {"$gt": 190}}}
  ]).toArray()
  items.forEach(function(doc){
    db.people.deleteOne({_id: doc._id})
  })