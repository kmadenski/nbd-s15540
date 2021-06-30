printjson(db.people.aggregate([
    {
      $set: {
        birth_date_converted: {
          $convert: {
            input: "$birth_date",
            to: "date"
          }
        }
      }
    },
    {$match: {birth_date_converted: {
          $gte: ISODate("2000-01-01T00:00:00.000Z"),
          $lt: ISODate("2099-12-31T23:59:59.999Z")
      }}}
  ]).toArray())