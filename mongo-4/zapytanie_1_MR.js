//map-reduce
//1

db.people.mapReduce(
    function(){
        emit(
            this.sex,
            parseFloat(this.height)
        );
    },
    function(sex,heights){
        return Array.avg(heights)
    },
    {out: "map_reduce_example_1_height"}
);

db.people.mapReduce(
    function(){
        emit(
            this.sex,
            parseFloat(this.weight)
        );
    },
    function(sex,weights){
        return Array.avg(weights)
    },
    {out: "map_reduce_example_1_weight"}
);
printjson({
    "wzrost": db.map_reduce_example_1_height.find().toArray(),
    "waga": db.map_reduce_example_1_weight.find().toArray()
});