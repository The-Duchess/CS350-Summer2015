To find shortest path I to g in v, e

Enqueue (I, O, -) in new min heap H
While H is not empty
(V l p) <- de queue H
If v = g
Return (v l p)
Mark v
For each unmarked neighbor v' of v
Enqueue (v', l + d(v, v') | d(v', g), v) in H
