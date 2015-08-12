# **Review**

- Graph

> definition

> - a set of vertices and edges
> - list of edges
> - adjacency matrix
> - adjacency list

> search algorithms

> - keep track of who you have vistited (done list)
> - label vertices/edges

> dijkstra's algorithm

> - priority queue (holds distances and parents) min queue on distance
> - running time: worst case asymptopic performance O(e)
> - proving the algorithm

>> - if it's an admissible heuristic (optimistic) then provably it cannot perform worse

> A*

> - heuristic improvement over dijkstra's

> minimum spanning weight Problem

>> single tree that touches every vertex and has the property that of all such trees it has the minimum total weight from edges

> kruskal's algorithm

> prim's algorithm

> - start wit ha vertex, pull all neighbors out, and then check weight and if they reconnect things that are already connected then repeat until all vertices are checked

> - running time O(elog(e))

- Master Theorem

> finds the big O complexity of certain recurences

> - form: aT[n/b] + Θ(n<sup>2</sup>)

> - very limited in how many recurences it can be applied over

- Floud Warschal's Transient Closure

> start by computing shortest path, then allow yourself to take shortcuts through vertices

> - example of dynamic programming

> - running time O(n<sup>3</sup>)

- Memoization

> hold onto previous work

> tradeoff in memory for computation time

> example

    def fib(n)
      if n = 1 then 1 // hold onto previous values
      if n = 2 then 1
      else fib(n - 1) + fib(n - 2)
    end

    // you can also work from the bottom up
    // this allows you to do linear time fib(n) which would normally be O(n)

- NP completeness

- Hash Function

> takes a larger value and turn it into a smaller value based on some representative information

> table: stores a bunch of values by key

    { 1 => "A", 2 => "B" }

> so what happens with collisions

>> sometimes two values have the same key

> options

> - chain the items into a list (bucket hash)

>> insertion and retrieval are more complicated but still 'constant' time


>> to be constant time the hash must be constant time (decent hash), and the chains have to be short


>> decent hash


>> - uniformly distributed

>> - same computed value for input each time but randomness


> - probing

>> jump down the pre-defined list of hashes and put the item in the next available one


>> insertion and retrieval are easier but deletion is harder


NOTE: amertized time: the 'average' time for a speficied performance. (i.e. the amertized time for worst case is average time for worst case)

NOTE: grey codes will not be on test but look it up

- NP complete

> - a problem's complexity is the worst complexity of the best possible algorithm for solving a problem

> - a class of problems is a set of problems that have similar structure

> - the class NP is the non-deterministic poly time solvable
