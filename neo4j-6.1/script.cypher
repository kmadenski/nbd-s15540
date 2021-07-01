//1
MATCH (d {name:'Darjeeling'} ),
      (s {name:'Sandakphu'}),
      p = shortestPath((d)-[*]-(s))
RETURN p,d,s
//2
MATCH (d {name:'Darjeeling'} ),
      (s {name:'Sandakphu'}),
      p = shortestPath((d)-[*]-(s))        
WHERE all(r in relationships(p) WHERE r.winter="true")
RETURN d,s,p
