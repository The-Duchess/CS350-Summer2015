# **Assignment 2B**

> Author: Isaac Archer

> Due Date: July 14th 13:00

**Algorithm: Array Intersection**

> input: 1-Based arrays arr_a and arr_b of positive integers. denote the size of arr_a by |arr_a| and similarly for b

> output: 1-Based array arr_c of positive integers, such that arr_c contains exactly one copy of each integer that appears somewhere in both arr_a arr_b. Thus, |arr_c| ≤ min(|arr_a|, |arr_b|).

      def array_intersection ← arr_a, arr_b

            arr_c ← []
            long_arr ← []
            short_arr ← []
            len_l ← 0
            len_s ← 0

            if |arr_a| > |arr_b|
                  len_l ← |arr_a|
                  len_s ← |arr_b|
                  long_arr ← arr_a
                  short_arr ← arr_b
            else if |arr_b| > |arr_a|
                  len_l ← |arr_b|
                  len_s ← |arr_a|
                  long_arr ← arr_b
                  short_arr ← arr_a
            else
                  len_l ← |arr_b|
                  len_s ← |arr_a|
                  long_arr ← arr_b
                  short_arr ← arr_a

            for i ← 1..len_s // O(n)
                  for j ← 1..len_l // O(m)
                       if short_arr[i] = long_arr[j]
                              if include ← arr_c, short_arr[i] // O(o)
                                    continue
                              else
                                    // input: array destination, integer to append to destination
                                    append ← arr_c, short_arr[i] // O(1)

            ↑ arr_c


> input: 1-Based array arr_temp and a integer num

> output: true if arr_temp contains num and false if arr_temp does not contain num


      def include ← arr_temp, num

            if |arr_temp| < 1 then ↑ false

            for k ← 1..|arr_temp|
                  if arr_temp[k] = num then ↑ true

            ↑ false


**Correctness**


**Worst Case**

**Generalization**

**Algorithm 2**
