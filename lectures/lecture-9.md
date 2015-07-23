# **Lecture 9**

graphs

> complexity for finding shortest past
>- depth first
>- breadth first
>- best first?

> Priority Queue that stores
>- lowest weight edges of neighbors

>Dijkstra's Algorithm

    def djikstra ← Graph, src

      dist[src] ← 0 //distance from source to source
      prev[src] ← undefined //previous node in optimal path initialization

      Graph.vertexes.each |v| //initialization
        if not v = src //where v has not yet been removed from Q
          dist[v] ← infinite //unknown distance function from source to v
          prev[v] ← undefined //previous node in optimal path from source

        add v → Q //All nodes initially in Q

      while not empty ← Q
        u ← Q.vertex with min dist[u] //Source node in first case
        Q.remove ← u

        (neighbors_of ← v, u).each //where v is still in Q
          alt ← dist[u] + length ← u, v
          if alt < dist[v] //A shorter path to v has been found
            dist[v] ← alt
            prev[v] ← u

      ↑ dist[], prev[]

> Using a Priority Queue

    def djikstra ← Graph, src
      dist[src] ← 0
      Graph.vertexes.each do |v|
        if not v = src
          dist[v] ← infinite
          prev[v] ← undefined

        add_with_priority v, dist[v] → Q

      while not empty ← Q
        u ← extract_min ← Q
        (neighbors_of ← v, u).each
          alt ← dist[u] + length ← u, v
          if alt < dist[v]
            dist[v] ← alt
            prev[v] ← u
            decrease_priority v, alt → Q

      ↑ dist[], prev[]

> n
