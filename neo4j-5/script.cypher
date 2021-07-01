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
//9
CREATE (CaptainAmerica:Movie {title:'Captain America', released:2011 , tagline:'The First Avenger'})
CREATE (Joe:Person {name:'Joe Johnston', born:1950})
CREATE (Markus:Person {name:'Christopher Markus', born:1970})
CREATE (McFeely:Person {name:'Stephen McFeely', born:1969})
CREATE (Simon:Person {name:'Joe Simon', born:1913})
CREATE (Evans:Person {name:'Chris Evans', born:1981})
CREATE (Weaving:Person {name:'Hugo Weaving', born:1960})
CREATE (Samuel:Person {name:'Samuel L. Jackson', born:1948})
CREATE
(Evans)-[:ACTED_IN {roles:['Captain America']}]->(CaptainAmerica),
(Weaving)-[:ACTED_IN {roles:['Johann Schmidt']}]->(CaptainAmerica),
(Samuel)-[:ACTED_IN {roles:['Nick Fury']}]->(CaptainAmerica),
(Joe)-[:DIRECTED]->(CaptainAmerica),
(Markus)-[:WRITED]->(CaptainAmerica),
(McFeely)-[:WRITED]->(CaptainAmerica),
(Simon)-[:WRITED]->(CaptainAmerica)

WITH CaptainAmerica as m
MATCH (a)-[:ACTED_IN|:WRITED|:DIRECTED]->(m) RETURN a,m;