# **Review**

**From Review Day**

- Graph

> definition

> - a set of vertices and edges
> - list of edges
> - adjacency matrix
> - adjacency list

> search algorithms

      def search ← G, s

            R ← G.root

            if R = s
                  ↑ R

            done ← []
            todo ← []

            foreach ← v in G.vertices that are neighbors to R
                  prepend → v, todo // add v to todo

            while !empty ← todo
                  foreach ← i in todo
                        if include ← done, i
                              remove i from todo
                              next

                        if i = s
                              ↑ i

                        if !include ← done, i
                              prepend → i, done // add i to done
                              remove i from todo
                              prepend → neighbors of i, todo

            ↑ null


> - keep track of who you have visited (done list)
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

> - start with a vertex, pull all neighbors out, and then check weight and if they reconnect things that are already connected then repeat until all vertices are checked

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

**FROM SCHEDULE**

- Recursion and ADTs

> - Binary search

      // searches the binary ADT with the root R by a search s
      def bin_find ← R, s
            temp ← R

            if (!temp.right and !temp.left) or temp = s
                  if temp = s then ↑ s else ↑ null

            if temp.right ⊑ s
                  bin_find temp.right, s

            if temp.left ⊑ s
                  bin_find temp.left, s

> - Binary search as tail Recursion

> - quicksort

      // sorts a list a
      def quick_sort ← a, low, high
            if low < high
                  p = partition ← a, low, high
                  quick_sort ← a, low, (p - 1)
                  quick_sort ← a. (p + 1), high

      partition ← a, low, high
            pivot ← a[high]
            i = low - 1
            for j ← low..(high - 1)
                  if a[j] ≤ pivot
                        i ← i + 1
                        swap ← a[i], a[j]
            i ← i + 1
            swap ← a[i], a[high]

            ↑ i

> - structure of an ADT

>> data objects, (carrier set), functions that operate on them, and laws

      Union-Find

      UNION-FIND Carrier Set: Arbitrary set E

      < U; E; operations:
                        init: E → U,
                        find: U → E,
                        union: U x U → U,
              laws:
                        find (init e; ) = e,
                        find (union u v) = find u or find v >

      Heap

      HEAP Carrier Set: Set of Elements mapped into a Priority Queue

      < H; ⊑: E x E; new: P(E),
                          insert: E x H → H,
                          extract-best H → (E, H),
                          empty: H → B,
                          extract-best-m (H, m) → (a, H) >


- Priority Queue and the Heap

> - Tree Traversal

> - The PQ ADT

      Priority Queue

      < E; ⊑: E x E; new: P(E),
                     insert: E x H → H,
                     extract-best H → (E, H),
                     empty: H → B >

> - Binary Heap

>> Heap implemented as a binary tree such that the nodes are more preferred than those below

      < H; ⊑: E x E; new: P(E),
                          insert: E x H → H,
                          extract-best H → (E, H),
                          empty: H → B,
                          extract-best-m (H, m) → (a, H) >

      extract-best-m (H, m) → (a, H) | a is a set of Elements | ∃ m ≤ |H|, |a| = m

      // check assignment 3 for implementation

> - Heapsort

>> sort it relative to priority how you sort the data structure it is implemented with

      // hand downheap the bottom most right most node
      downheap ← H

        if is_leaf ← H
          ↑

        if H ⊑ H.l and H ⊑ H.r
          ↑

        H.g ← ⊑ ← H.l, H.r
        exchange H and H.g
        downheap ← H.g

> - Trees and Graphs: Definitions and Representation

>> - a Tree is a set of vertices that point to other vertices

>> - a graph is a set of vertices and edges

- Recurrences

> - Master Theorem: Definition

>> the master theorem solves the complexity of algorithms with recurrences that fit in the pattern:

      T[n] = aT[n/b] + f(n) where a ≥ 1, b > 1

      // - n is the size of the problem
      // - a is the number of subproblems in the recursion
      // - n/b is the size of each subproblem
      // f(n) is the cost of the work done outside the recursive calls

> - Applying the Master Theorem

> - Solving a Recurrence

- Tree and Graph Algorithms

> - depth first spanning tree

>> - Depth First Search

      // recursive depth-first search
      def proc ← G, v
            label v as discovered
            for all edges from v to w in G.adjacentEdges ← v
                  if vertex  w is not labeled as discovered then
                        proc ← G, w

      // non-recursive depth-first search
      def proc ← G, v
            S ← stack
            push → v, S // push v onto S
            while !empty ← S
                  v = pop ← S
                  if v is not labeled as discovered:
                        label v as discovered
                        for all edges from v to w in G.adjacentEdges ← v
                              push → w, S // push w onto S

>> - spanning tree: a spanning tree T of an undirected graph G is a subgraph that includes all vertices of G that is a tree

> - Prim's Algorithm

> - Kruskal's Algorithm

      def kruskal ← G
            A = null

            foreach ← v ∈ G.vertices
                  MAKE-SET ← v

            foreach ← u, v ordered by weight ← u, v, increasing
                  if FIND-SET ← u ≠ FIND-SET ← v
                        A = A ∪ {(u, v)}
                        UNION ← u, v

            ↑ A

> - Dijkstra's Algorithm

      def dijktra ← G, src

            dist[src] ← 0
            prev[src] ← undefined

            create vertex set Q

            foreach ← v ∈ G.vertices
                  if v ≠ src
                        dist[v] ← infinite
                        prev[v] ← undefined

                  add → v, Q // add v to Q

            while !empty ← Q
                  u ← vertex in Q with min dist[u]
                  remove u from Q

                  foreach ← neighbor v of u
                        alt ← dist[u] + length ← u, v
                        if alt < dist[u] + length ← u, v
                              dist[v] ← alt
                              prev[v] ← u

            ↑ dist[], prev[]


- Optimized Shortest path

> - A* Algorithm

      function A*(start,goal)
          closedset := the empty set    // The set of nodes already evaluated.
          openset := {start}    // The set of tentative nodes to be evaluated, initially containing the start node
          came_from := the empty map    // The map of navigated nodes.

          g_score := map with default value of Infinity
          g_score[start] := 0    // Cost from start along best known path.
          // Estimated total cost from start to goal through y.
          f_score = map with default value of Infinity
          f_score[start] := g_score[start] + heuristic_cost_estimate(start, goal)

          while openset is not empty
              current := the node in openset having the lowest f_score[] value
              if current = goal
                  return reconstruct_path(came_from, goal)

              remove current from openset
              add current to closedset
              for each neighbor in neighbor_nodes(current)
                  if neighbor in closedset
                      continue

                  tentative_g_score := g_score[current] + dist_between(current,neighbor)

                  if neighbor not in openset or tentative_g_score < g_score[neighbor]
                      came_from[neighbor] := current
                      g_score[neighbor] := tentative_g_score
                      f_score[neighbor] := g_score[neighbor] + heuristic_cost_estimate(neighbor, goal)
                      if neighbor not in openset
                          add neighbor to openset

          return failure

      function reconstruct_path(came_from,current)
          total_path := [current]
          while current in came_from:
              current := came_from[current]
              total_path.append(current)
          return total_path

> - All-pairs shortest path

- Hashing

> - Hash Functions

> - Bucket Hashing, chain hashing

> - Open Hashing

> - Hash table grow / shrink

>> easy to grow (but it is slower and not technically constant time) and shrink with bucket, hard with probing (pulling the hash up is not doable so you have to leave empty markers)

- randomness

>> - [RNGs](https://en.wikipedia.org/wiki/Random_number_generation) and [PRNGs](https://en.wikipedia.org/wiki/Pseudorandom_number_generator)

>> Random Number Generation and Psuedo Random Number Generation

>> - Random Distributions

>> - Finding Large Psuedo-Primes

- Memoization

> - memoization and dynamic programming: definition

- NP completeness

>> a problem is NP complete when it is both NP and NP-hard

>> - NP: non-deterministic polynomial time, set of all decision problems for which the instances where the answer is yes have efficiently verifiable proofs of the fact that the answer is yes

>> - NP-hard: at least as hard as NP

NOTE: If P ≠ NP, then NP-hard problems cannot be solved in polynomial time;

NOTE: If an optimization problem H has an NP-complete decision version L, then H is NP-hard.

- Other Definitions

> - Transient Closure: the transient closure of a binary relation R on a set X is the transitive relation R<sup>+</sup> on set X such that R and R<sup>+</sup> is minimal.

> - Transitive Relation: a binary relation R over a set X is transitive if whenever an element a is related to b and b is related to c then a is related to c.
