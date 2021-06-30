//map-reduce
//2
db.people.mapReduce(
    function(){
        this.credit.forEach(function(credit){
            emit(
                credit.currency,
                parseFloat(credit.balance)
            );
        })
    },
    function(currency,amount){
        return Array.sum(amount)
    },
    {out: "map_reduce_example_2"}
);
printjson(db.map_reduce_example_2.find().toArray());