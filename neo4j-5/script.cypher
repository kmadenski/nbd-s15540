//1
MATCH (movie:Movie) RETURN movie
//2
MATCH (hugo:Person {name: "Hugo Weaving"})-[:ACTED_IN]->(hugoWeavingMovies) RETURN hugo,hugoWeavingMovies