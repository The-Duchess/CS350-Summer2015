# **Asignment 2A**

> Author: Isaac Archer

> Due Date: July 14th 13:00

**Algorithm: First Long 1-String**

> input: A one based array arr of n elements, with the elements drawn from the set {0, 1}. An integer lower bound lb.

> output: the index of the first position in arr such that there is a string of lb 1s starting at that position. That is: a position i in arr such that a[i..i+m] are all 1s and there is no position j < i in arr with this property. if there is no string of lb 1s in arr, fail.


      def first-long ← arr, lb // O(n<sup>2</sup>)

            cur_i ← -1 // value to show failure to find first long 1-string

            for i ← 1..|arr| // O(n)
                  if arr[i] = 1
                        cur_i ← i
                        k ← i
                        for j ← k..|arr| // O(n)
                              i += 1
                              if arr[j] = 1
                                    continue
                              else
                                    cur_i ← -1


                  if cur_i = -1 then ↑ fail

                  ↑ cur_i

**Correctness**

**Worst Case**

**Best Case**
