//map-reduce
//5
db.people.mapReduce(
    function(){
        if(this.nationality == 'Poland' && this.sex == 'Female'){
            this.credit.forEach(function(credit){
                emit(
                    credit.currency,
                    parseFloat(credit.balance)
                );
            })
        }
        
    },
    function(currency,amount){
        return Array.sum(amount)
    },
    {out: "map_reduce_example_5"}
);
printjson(db.map_reduce_example_5.find().toArray());