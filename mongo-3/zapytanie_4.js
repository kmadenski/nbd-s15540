printjson(db.people.aggregate([
    {
      $set: {
        weight_num: {
          $convert: {
            input: "$weight",
            to: "double"
          }
        }
      }
    },
    {$match: {weight_num: {"$gt": 68, "$lte": 71.5}}}
  ]).toArray())