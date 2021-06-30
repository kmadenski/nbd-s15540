//map-reduce
//3
printjson(db.people.findOne());
db.people.mapReduce(
    function(){
        emit(
            this.job,
            null
        );
    },
    function(job){
        return job
    },
    {out: "map_reduce_example_3"}
);
printjson(db.map_reduce_example_3.find().toArray());