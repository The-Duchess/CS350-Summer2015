# **Assignment 4**

Author: Isaac Archer

Due Date: August 11, 2015 13:00

# **Part 1**

**Part (a)**

Problem Description:

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

```ruby
      class Union_Find
            @@elements = []

            def initialize()
                  # do nothing
            end

            def add_vertex(t_e)

                  to_insert = false

                  @@elements.each do |a|
                        if a.name == t_e.name
                              to_insert = false; break;
                        end
                  end

                  if to_insert
                        @@elements.push(t_e)
                        self.sort!
                  end
            end

            def find
                  return @@elements
            end

            def sort!
                  # do nothing
            end
      end

      class Element
            @@begin = ""
            @@end = ""
            @@len = 0
            @@parent = nil
            @@name = ""

            def initialize(start, stop, len)
                  @@begin = start.to_s
                  @@end = stop.to_s
                  @@parent = parent
                  @@len = len
                  @@name = "#{start_stop}"
            end

            def start_p
                  return @@begin
            end

            def end_p
                  return @@end
            end

            def len
                  return @@len
            end

            def set_parent(t_parent)
                  @@parent = t_parent
            end

            def parent
                  return @@parent
            end

            def name
                  return @@name
            end
      end

      def init(t_ea, t_eb, ds, parent)

            t_e = Element.new(t_ea, t_eb, ds)

            t_e.set_parent(parent)

            t_u = Union.new

            t_u.add_vertex(t_e)

            return t_u
      end

      def find(t_u)
            t_u.sort!

            t_cur = t_u.elements[t_u.elements.length - 1]

            while t_cur.parent != nil
                  if t_cur.parent != nil
                        t_cur = t_cur.parent
                  else
                        break
                  end
            end

            return t_cur

      end

      def union(t_u_a, t_u_b)
            E_a = []
            E_b = []
            U_t = Union_Find.new

            t_u_a.elements.each { |i| E_a.push(i) }
            t_u_b.elements.each { |j| E_b.push(j) }

            E_arr = union_set(E_a, E_b)

            E_arr.each do |k|
                  U_t.add_vertex(k)
            end

            return U_t
      end

      def union_set(arr_a, arr_b)
            t_arr = []

            arr_a.each do |i|
                  arr_b.each do |j|
                        if i.start_p == j.start_p and i.end_p == j.end_p and i.len == j.len
                              t_arr.push(i)
                        else
                              next
                        end
                  end
            end

            return t_arr
      end

```

# **Part 2**

```ruby

```


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
- complexity: O(n + m + o) where n, m and o are x, y, z respectively

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

> description: compares the current total + the value to add against the requirements

      def compare ← cur, reg, add
            c ← false

            for i ← 1..3
                  if cur[i] + add[i] ≤ req[i] and (c or true if i = 1)
                        c ← true
                  else
                        c ← false

            ↑ c


Add to solution

- input: int, char, array
- output: changes in place by reference so none
- complexity: O(1)

> description: adds to the solution array to increment the correct conglomerate

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
