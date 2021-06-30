//map-reduce
//4
db.people.mapReduce(
    function(){
        emit(
            this.nationality,
            parseFloat(this.weight)/Math.pow(parseFloat(this.height),2)
        );
    },
    function(job,bmi){
        return Array.avg(bmi)
    },
    {out: "map_reduce_example_4"}
);
printjson(db.map_reduce_example_4.find().toArray());