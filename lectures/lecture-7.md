# **Lecture 7**

Priority Queue ADT
stores elements and get them out in a best-first order
⊆ is best, not greater than | sub set

    < E; ⊆: E x E; new: P(E),
      					 insert: E x H -> H,
      					 extract-best H -> (E, H),
      					 empty: H -> B >

best is some best match for some criteria relative to the elements

    e is "best" of a set E iff for all e' in E . e ⊆ e'

> best-first

    n <- |a|
    b <- a[1]
    j <- 1
    for i <- 2..|a|
      if a[i] ⊆ b
        b <- a[i]
        j <- i

      a[j] <- a[n]
      shrink a by 1
      return a, b

Invariant
> an invariant: a property of a data structure that holds true throughout the course of the algorithm.

Heap
> a heap is a Priority Queue

> it can be implemented as a binary tree

> invariant: for every node in a heap the value at that node is better than any of it's children.

> extract-best
>> extract best should remove a node and reorder the tree to maintain the invariant. you are allowed to temporarily break it but if it is restored by the completion of the algorithm it does not break anything. so for a binary tree when you extract you can take a bottom element (right most bottom node) and replace the extracted element and then push ir down to balance the tree. this keeps the tree pretty balanced and will restore the invariant for a heap.

    extract-best:
      save root in r
      remove root
      replace root with rightmost bottom element
      downheap from root
      return r

> downheap

    downheap(H):

      if H is a leaf
        return

      if H is better than H.l and H is better than H.r
        return

      H.g <- better of H.l, H.r
      exchange H and H.g
      downheap(H.g)

> insert

    insert(A):
      put A in the first free spot
      upheap from A
      return

> upheap

    upheap(H):

      if H is root
        return

      if H.parent is better than H
        return

      exchange H.parent and H
      upheap(H.parent)

LBBT (left based binary tree) implemented as an array

> T: collection of E

    < ⊆; new: T, root: T -> B, empty: T -> B,
                 insert-last: E x T -> T,
                 remove-last: T -> E x T
                 left, right, parent: T -> T
                 exchange: T x T -> T >

> left(i) = 2i

> right(i) = 2i + 1

> parent(i) = floor(i/2)

> at depth k there are 2k - 1 nodes

> above(i) = 2<sup>k-1</sup> - 1 ??

> right_of(i) = 2<sup>k</sup> - i - 2<sup>k</sup> - 1 ??

> to save space as well as performance you do changes in place

> best elements in extract can go at the end

> this sorts the array backwards

> heap sort
>> this is the nlg <- n sorting complexity

Trees
>- graphs | every non-repeating path P | |P| >= 2
> has unconnected endpoints

> graphs
>- consists of nodes and edges connecting the nodes

>- n nodes, n - 1 edges, connected

> node

    node:
      children <- []
      parents <- []
      edges <- []

> edge
>> directed edge

    edge:
      directed <- {} // node => node
      non_directed <- [] // [node, node] two connected nodes
