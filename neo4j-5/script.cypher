//1
MATCH (movie:Movie) RETURN movie
//2
MATCH (hugo:Person {name: "Hugo Weaving"})-[:ACTED_IN]->(movies) RETURN hugo,movies
//3
MATCH (hugo:Person {name: "Hugo Weaving"})-[:ACTED_IN]->(movies:Movie)<-[:DIRECTED]-(director:Person) RETURN director
//4
MATCH (hugo:Person {name: "Hugo Weaving"})-[:ACTED_IN]->(movies:Movie)<-[:ACTED_IN]-(actor:Person) RETURN actor
//5
MATCH (matrix:Movie {title:"The Matrix"})<-[:ACTED_IN]-(actor:Person)-[:ACTED_IN]->(movie:Movie) RETURN movie
//6
MATCH (movie:Movie)<-[ar:ACTED_IN]-(actor:Person) RETURN actor, COUNT(ar)
//7
MATCH (movie:Movie)<-[wr:WROTE]-(actor:Person)-[dr:DIRECTED]->(movie:Movie) RETURN movie,actor
//8
MATCH (keanu:Person {name:"Keanu Reeves"})-[:ACTED_IN]->(movie:Movie)<-[:ACTED_IN]-(hugo:Person {name: "Hugo Weaving"}) RETURN movie