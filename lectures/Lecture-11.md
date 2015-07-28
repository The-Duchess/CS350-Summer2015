To find shortest path I to g in v, e

Enqueue (I, O, -) in new min heap H
While H is not empty
(V l p) <- de queue H
If v = g
Return (v l p)
Mark v
For each unmarked neighbor v' of v
Enqueue (v', l + d(v, v') | d(v', g), v) in H


Time O(v^3)
Space is O(v^2)
H <- array
  For (v1, v2, l) in E
    H[v1, v2] <- (v2, l)
    H[v2, v1] <- (v1, l)
    For v0 in v
      For (v1, v2) in 
        //if statements
        //we get new vortexes and check if we have a shorter vertex
        //we get H[v1, v2] <- (H[v1, v0]h, H[v1, v0] + H[v2, v0])
