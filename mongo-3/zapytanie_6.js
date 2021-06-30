printjson(db.people.insertOne(
    {
      birth_date: "1991-07-01T07:22:24Z",
      credit: [
        {
          type: "mastercard",
          number: "42424242424242424",
          currency: "USD",
          balance: "9000000"
        }
      ],
      description: "some guy with mongodb skill",
      email: "s15540@pjwstk.edu.pl",
      first_name: "Krzysztof",
      height: "183",
      job: "CTO/CPU",
      last_name: "Madeński",
      location: {
        city: "Legionowo",
        address: {
          streetname: "Koszykowa",
          streetnumber: "40"
        }
      },
      nationality: "Poland",
      sex: "Male",
      weight: "95"
    }
  ))