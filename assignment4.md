# **Assignment 4**

# **Part 1**

**Part (a)**

Union-Find

      UNION-FIND Carrier Set: Arbitrary set E

      < U; E; operations:
                        init: E → U,
                        find: U → E,
                        union: U x U → U,
              laws:
                        find (init e; ) = e,
                        find (union u v) = find u or find v >

      ELEMENT: Tuple of start and end

      < E; BEGIN, END, Parent → E;
                              new: B, N, P → E,
                              start: E → B,
                              end: E → N,
                              parent: E → P >

Init

- input: an element e
- output: a union
- complexity: O(1)

> description: initializes the element by wrapping it in a union and setting the parent

      def init ← e

          E ← []
          append e → E

          foreach ← i ∈ E
                add_vertex i → t_U

          ↑ t_U

Find

- input: a union
- output: parent element
- complexity: O(n)

> description: find returns the canonical representative (one without a parent)

      def find ← u

            cur ← u

            while cur
                  if cur.parent
                        then cur ← parent
                  else
                        break


           ↑ cur

Union

- input: two unions
- output: a union of the inputs
- complexity: O(2m + 2n) or O(m + n)

> description: creates a union of two unions

      def union ← u1, u2

            E1 ← []
            E2 ← []

            foreach ← i ∈ u1.v
                  append i → E1

            foreach ← i ∈ u2.v
                  append i → E2

            E ← E1 ∪ E2

            foreach ← i ∈ E
                  add_vertex i → U


**Part (b)**

# **Part 2**

# **Part 3**

Conglomerate (label): materials

      Alphium (A): X
      Betium (B):  Y
      Cetium (C):  Z
      Deltium (D): XXXYYYZ (3X3YZ)
      Etium (E):   YYZZZZZ (2Y5Z)
      Ferium (F):  XXXXXXZZ (6X2Z)
      Gatium (G):  XXYYYYYYZ (2X6YZ)
      Herium (H):  YZZ (Y2Z)

Calculate requirements

- input: requirements x, y, z | x is a number of X material and similar for y and z
- output: minimum collection of conglomerates as an array A..H
- complexity: O(3n) or O(n)

> description: using preferred high adds first we add to a total (such that we do not exceed the requirements) in the largest increments thus minimizing the number of conglomerates we use.


      def calc ← x, y, z

            // conglomerates
            A ← [1, 0, 0]
            B ← [0, 1, 0]
            C ← [0, 0, 1]
            D ← [3, 3, 1]
            E ← [0, 2, 5]
            F ← [6, 0, 2]
            G ← [2, 6, 1]
            H ← [0, 1, 2]

            ARR_x ← [F, D, G, A] // array of conglomerates for X
            ARR_y ← [G, D, E, H, B] // array of conglomerates for y
            ARR_z ← [E, F, H, G, D, C] // array of conglomerates for z

            REQ ← [x, y, z] // requirements from input
            CUR ← [0, 0, 0] // progress in filling requirements for x, y, z

            // array of the number of materials X, Y, Z by conglomerates A..H
            SOL ← [0, 0, 0, 0, 0, 0, 0, 0]

            for i ← 1..3

                  // when progress is not complete keep trying to fill the requirements
                  while REQ[i] > CUR[i] do
                        if i = 1 // x
                              for j ← 1..|ARR_x|
                                    if compare ← CUR, REQ, ARR_x[j]
                                          CUR[0] += ARR_x[j][0]
                                          CUR[1] += ARR_x[j][1]
                                          CUR[2] += ARR_x[j][2]
                                          add ← j, "x", ref SOL
                        else if i = 2 // y
                              for j ← 1..|ARR_y|
                                    if compare ← CUR, REQ, ARR_y[j]
                                          CUR[0] += ARR_x[j][0]
                                          CUR[1] += ARR_x[j][1]
                                          CUR[2] += ARR_x[j][2]
                                          add ← j, "y", ref SOL
                        else // z
                              for j ← 1..|ARR_z|
                                    if compare ← CUR, REQ, ARR_z[j]
                                          CUR[0] += ARR_x[j][0]
                                          CUR[1] += ARR_x[j][1]
                                          CUR[2] += ARR_x[j][2]
                                          add ← j, "z", ref SOL

                       ↑ SOL

Compare conglomerates

- input: three arrays cur, req, add
- output: true if can be added, false if cannot
- complexity: O(3)

      def compare ← cur, reg, add
            c ← false

            for i ← 1..3
                  if cur[i] + add[i] ≤ req[i] and c
                        c ← true
                  else
                        c ← false

            ↑ c


Add to solution

- input: int, char, array
- output: changes in place by reference so none
- complexity: O(1)

      def add ← n, c, arr

            if c = "x"
                  if n = 1
                        arr[6] += 1
                        ↑
                  if n = 2
                        arr[4] += 1
                        ↑
                  if n = 3
                        arr[7] += 1
                        ↑
                  if n = 4
                        arr[1] += 1
                        ↑
            else if c = "y"
                  if n = 1
                        arr[7] += 1
                        ↑
                  if n = 2
                        arr[4] += 1
                        ↑
                  if n = 3
                        arr[5] += 1
                        ↑
                  if n = 4
                        arr[8] += 1
                        ↑
                  if n = 5
                        arr[2] += 1
                        ↑
            else if c = "z"
                  if n = 1
                        arr[5] += 1
                        ↑
                  if n = 2
                        arr[6] += 1
                        ↑
                  if n = 3
                        arr[8] += 1
                        ↑
                  if n = 4
                        arr[7] += 1
                        ↑
                  if n = 5
                        arr[4] += 1
                        ↑
                  if n = 6
                        arr[3] += 1
                        ↑
