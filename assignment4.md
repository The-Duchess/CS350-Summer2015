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

      < E; BEGIN, END, PARENT, NAME;
                              new: E, E, E, S → E,
                              start: E → E,
                              end: E → E,
                              parent: E → E,
                              name: E → S >

Init

- input: an element e
- output: a union
- complexity: O(1)

> description: initializes the element by wrapping it in a union and setting the parent

      def init ← e

          set_parent ← e

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
- complexity: O(2m + 2n + mn) or O(m + n + mn)

> description: creates a union of two unions

      def union ← u1, u2

            E1 ← []
            E2 ← []

            foreach ← i ∈ u1.v // O(m)
                  append i → E1

            foreach ← i ∈ u2.v // O(n)
                  append i → E2

            E ← E1 ∪ E2 O(mn)

            foreach ← i ∈ E // O(m + n)
                  add_vertex i → U

            ↑ U

**Part (b)**

**Implementation of Algorithm**

```ruby
      class Union_Find
            def initialize
                  @edges = []
            end

            def add_edge(edge)
                  @edges.push(edge)
            end

            def path_exists?(v_a, v_b)
                  # if a path exists between v_a and v_b return true
                  to_do = []
                  to_do.push(v_a)

                  done = []

                  len = 0

                  while !to_do.empty?
                        temp = to_do[0]
                        to_do.delete_at(0)
                        done.push(temp)
                        temp_chk = []
                        @edges.each { |e| if e[:start] == temp then temp_chk.push(e[:end]) end }
                        temp_chk.each do |t|
                              if t == v_b

                                    if len < 2 then next end

                                    return true
                              end

                              if !done.include? t
                                    to_do.push(t)
                              end
                        end

                        len = len + 1
                  end

                  return false
            end

            def connected(v_a, v_b)

                  if path_exists?(v_a, v_b)
                        return true
                  end

                  return false
            end

            def union(v_a, v_b)
                  @edges.map! { |i| (i == v_a) ? v_b : i }
            end
      end
```

# **Part 2**

**Implementation of Kruskals**

```ruby
      def check_reverse(v_a, v_b, min_tree)
            min_tree.each do |v|
                  if ((v[:start] == v_a and v[:end] == v_b) or (v[:end] == v_a and v[:start] == v_b))
                        return true
                  end
            end

            return false
      end

      file = File.readlines("city-pairs.txt")

      lines = file.map { |fr| fr.split("\n").map(&:to_s) }

      set_V = Union_Find.new

      edges = []

      vertexes = []

      i = 0

      lines.each do |line|
            t_tokens = line[0].split(" ").map(&:to_s)
            t_edge = { :start => t_tokens[0], :end => t_tokens[1], :length => t_tokens[2].to_i }

            if !vertexes.include? t_tokens[0]
                  vertexes.push(t_tokens[0].to_s)
            end

            if !vertexes.include? t_tokens[1]
                  vertexes.push(t_tokens[1].to_s)
            end

            edges.push(t_edge)
            set_V.add_edge(t_edge)
            i += 2
      end

      i = 0

      edges.sort_by! { |v| v[:length] }

      min_tree = []

      edges.each do |edge|
            if !set_V.connected(edge[:start], edge[:end])
                  if !check_reverse(edge[:start], edge[:end], min_tree)
                        min_tree.push(edge)
                  end
                  set_V.union(edge[:start], edge[:end])
            end
      end

      puts min_tree
```

**Minimum Spanning Tree**

INCLUDED AS A FILE

# **Part 3**

**Algorithm**

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

NOTE: Polynomial version is below linear one

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


Calculate requirements in polynomial time

- input: x, y, z integers of the respective material, current progress on those three and the solution
- output: minimum collection of conglomerates as an array A..H
- complexity: O(n<sup>2</sup>)

> description: polynomial time version

      def calc ← x, y, z, sol

            // conglomerates
            A ← [1, 0, 0]
            B ← [0, 1, 0]
            C ← [0, 0, 1]
            D ← [3, 3, 1]
            E ← [0, 2, 5]
            F ← [6, 0, 2]
            G ← [2, 6, 1]
            H ← [0, 1, 2]

            ARR_*[A, B, C, D, E, F, G, H]

            REQ ← [x, y, z]
            PRO ← [0, 0, 0]

            TOTAL ← 0

            for i ← 1..|sol|
                  TOTAL += sol[i]


            for j ← 1..(max ← x, y, z) // O(n) * O(8)
                  for i ← 1..8
                        if (REQ[1] ≥ PRO[1] += ARR_*[i][1]) && (REQ[2] ≥ PRO[2] += ARR_*[i][2]) && (REQ[3] ≥ PRO[3] += ARR_*[i][3])
                              PRO[1] += ARR_*[i][1]
                              PRO[2] += ARR_*[i][2]
                              PRO[3] += ARR_*[i][3]


            if (calc ← x, y, z, PRO) ≥ sol // O(n) * O(8)
                  ↑ sol


**Correctness**

- Returning the Correct Value

> The algorithm arranges a number of hardcoded values to create preference and then it keeps track of the current progress relative to the requirements such that it never adds when the total will exceed the requirements; this is checked by compare which will check all materials. After adds are done it uses add to increment the correct element in the solution array that is organized A..H for the conglomerates. Therefore all values are correct and the numbers that represent amounts of A..H are accurate and no higher than they need to be.

- Returning the Correct Value polynomial

> it performs all possible tests on constructing a list of purchased materials and checks it against another and then if it's smaller it returns up, giving the smallest possible number of conglomerates. it also does the same check to not get more material than it will need in a similar check against requirements as from the linear one.

- Halting

> The Algorithm can never fail to add some value due to waiting for the values to be equal to the requirements. but it will continue to the next material when it is complete and when they are all done A..H use will return. therefore it will halt.

- Halting polynomial

> since there is a fail out of the recursive call it will eventually find a minimum and return up; but not without checking all possible options first.

**Complexity**

- Linear

> The Algorithm performs 3 checks against the requirements that will at worst increment the number of times of the requirement therefore the complexity is O(n+m+o).

- Polynomial

> O(n<sup>2</sup>)

# **Extra Credit**

If we are allowed to waste material, then we should determine an allowable amount of waste, or we cannot have a concrete answer that that can be defined as correct with specified margin for excess thus no algorithm can be considered correct with specified margin for error. so we should add inputs for tolerable level of wasted material; the most accurate is per material but we could have a running total of overflow that cannot be exceeded or must be exceeded. This seems like a somewhat purposeless algorithm since we always want to optimize and unless there is some other cost we want to optimize against why would we allow for waste? but that aside and setting limits not being taken into account we can easily just remove the restriction on excess which actually simplifies the algorithm.

**For any allowed excess**

Calculate with no restriction on excess

- input: requirements x, y, z | x is a number of X material and similar for y and z
- output: minimum collection of conglomerates as an array A..H
- complexity: O(n + m + o) where n, m and o are x, y, z respectively

> description: calculate the 'minimum' number of conglomerates used but do it lazily so we do not care about excess.

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

            // these can be customized to change the amount of excess
            // but we are allowing so we don't really care
            ARR_x ← [F, D, G, A] // array of conglomerates for X
            ARR_y ← [G, D, E, H, B] // array of conglomerates for y
            ARR_z ← [E, F, H, G, D, C] // array of conglomerates for z

            REQ ← [x, y, z] // requirements from input
            CUR ← [0, 0, 0] // progress in filling requirements for x, y, z

            // array of the number of materials X, Y, Z by conglomerates A..H
            SOL ← [0, 0, 0, 0, 0, 0, 0, 0]

            for i ← 1..3

                  // when progress is not complete keep trying to fill the requirements
                  // this time allow excess by removing the compare
                  // and breaking after the specific value is at least meeting the requirements
                  while REQ[i] > CUR[i] do
                        if i = 1 // x
                              for j ← 1..|ARR_x|
                                    if CUR[i] ≥ REQ[i]
                                          break

                                    CUR[1] += ARR_x[j][1]
                                    CUR[2] += ARR_x[j][2]
                                    CUR[3] += ARR_x[j][3]
                                    add ← j, "x", ref SOL
                        else if i = 2 // y
                              for j ← 1..|ARR_y|
                                    if CUR[i] ≥ REQ[i]
                                          break

                                    CUR[1] += ARR_x[j][1]
                                    CUR[2] += ARR_x[j][2]
                                    CUR[3] += ARR_x[j][3]
                                    add ← j, "y", ref SOL
                        else // z
                              for j ← 1..|ARR_z|
                                    if CUR[i] ≥ REQ[i]
                                          break

                                    CUR[1] += ARR_x[j][1]
                                    CUR[2] += ARR_x[j][2]
                                    CUR[3] += ARR_x[j][3]
                                    add ← j, "z", ref SOL

            ↑ SOL



Calculate requirements in polynomial time without caring about wasted materials

- input: x, y, z integers of the respective material, and the last solution
- output: minimum collection of conglomerates as an array A..H

> description: polynomial time version that doesn't care about wasted material by flipping the check if greater than or equal to less than or equal

      def calc ← x, y, z, sol

            // conglomerates
            A ← [1, 0, 0]
            B ← [0, 1, 0]
            C ← [0, 0, 1]
            D ← [3, 3, 1]
            E ← [0, 2, 5]
            F ← [6, 0, 2]
            G ← [2, 6, 1]
            H ← [0, 1, 2]

            ARR_*[A, B, C, D, E, F, G, H]

            REQ ← [x, y, z]
            PRO ← [0, 0, 0]

            TOTAL ← 0

            for i ← 1..|sol|
                  TOTAL += sol[i]


            for i ← 1..8
                  for j ← 1..(max ← x, y, z)
                        if (REQ[1] ≤ PRO[1] += ARR_*[i][1]) && (REQ[2] ≤ PRO[2] += ARR_*[i][2]) && (REQ[3] ≤ PRO[3] += ARR_*[i][3])
                              PRO[1] += ARR_*[i][1]
                              PRO[2] += ARR_*[i][2]
                              PRO[3] += ARR_*[i][3]

                        if (calc ← x, y, z, PRO) ≥ sol
                              ↑ sol


**Correctness**

- Polynomial Time

> since the algorithm is virtually the same as the one that cares about excess the same correctness will work.

- Returning the Correct Value

> The Algorithm cannot determine a specific range of correct values, the only correctness we can show is that the materials required will be either equal to or greater than that which is needed. as the algorithm follows the same basic idea as one restricted to zero excess but it allows for the the current material being assessed to exceed and it does not check other material excesses. but because it will always break when it has met the required materials and the outer check for all materials is finite and inputs should be finite therefore the algorithm will halt.

- Halting

> The Algorithm can never fail to add some value due to waiting for the values to be equal or greater to the requirements. but it will continue to the next material when it is equal or greater to the requirement and when they are all done A..H use will return. therefore it will halt.

**Complexity**

- Linear

> The Algorithm performs 3 checks against the requirements that will at worst increment the number of times of the requirement therefore the complexity is O(n+m+o). however due to the lack of caring about excess the algorithm will perform no worse than the original and in some implementations and cases it may perform better.

- Polynomial Time

> since the algorithm is virtually the same as the one that cares about excess the same complexity will work; but it will likely perform better in some implementations/cases.
