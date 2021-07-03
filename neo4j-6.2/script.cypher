//4
MATCH (airport:Airport) <- [:ORIGIN] - (flight:Flight)
WITH airport AS airports, COUNT(flight) AS howMuch
RETURN airports, howMuch
ORDER BY howMuch
//5
MATCH p = (airport:Airport{name: "LAX"}) <- [:ORIGIN] - (flight:Flight) - [:DESTINATION] -> (target:Airport)
WHERE REDUCE(cost = 0, n IN [x IN NODES(p) WHERE "Flight" IN LABELS(x)] |
  cost + [(n)<-[:ASSIGN]-(ticket) | ticket.price][0]
  ) < 3000
RETURN p
//6
MATCH p = (airport:Airport{name: "LAX"}) <- [:ORIGIN] - (flight:Flight) - [:DESTINATION] -> (destination:Airport {name: "DAY"})
WITH p, REDUCE(cost = 0, n IN [x IN NODES(p) WHERE "Flight" IN LABELS(x)] |
  cost + [(n)<-[:ASSIGN]-(ticket) | ticket.price][0]
  ) AS ticketcostCost
RETURN p, cost
ORDER BY cost
//7
MATCH p = (airport:Airport{name: "LAX"}) <- [:ORIGIN] - (flight:Flight) - [:DESTINATION] -> (destination:Airport {name: "DAY"})
WITH p, REDUCE(cost = 0, n IN [x IN NODES(p) WHERE "Flight" IN LABELS(x)] |
  cost + [(n)<-[:ASSIGN]-(ticket) | ticket.price][0]
  ) AS cost
RETURN p, cost
ORDER BY cost LIMIT 1
//8
MATCH p = (airport:Airport{name: "LAX"}) <- [:ORIGIN] - (flight:Flight) - [:DESTINATION] -> (destination:Airport {name: "DAY"})
WITH p, REDUCE(cost = 0, n IN [x IN NODES(p) WHERE "Flight" IN LABELS(x)] |
  cost + [(n)<-[:ASSIGN]-(ticket{class: "business"}) | ticket.price][0]
  ) AS cost
RETURN p, cost
ORDER BY cost LIMIT 1
//9
MATCH p = (airport:Airport) <- [:ORIGIN] - (flight:Flight) - [:DESTINATION] -> (destination:Airport)
WITH flight.airline as Airlines, airport.name + "_" + destination.name AS pair
RETURN Airlines, COUNT(DISTINCT pair) AS connections
ORDER BY connections
//10
MATCH p = (airport1:Airport)<-[:ORIGIN]-(flight:Flight)-[:DESTINATION]->(airport2:Airport)<-[:ORIGIN]-(flight2:Flight)-[:DESTINATION]->(destination:Airport)
WHERE (airport1  <> airport2) AND (airport1 <> destination) AND (airport2 <> destination)
WITH p, REDUCE(cost = 0, n IN [x IN NODES(p) WHERE "Flight" IN LABELS(x)] |
  cost + [(n)<-[:ASSIGN]-(ticket{class: "economy"}) | ticket.price][0]
  ) AS cost
RETURN p, cost
ORDER BY cost LIMIT 1