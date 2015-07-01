# **Assignment 1**
> Author: Isaac Archer

> Name: Assignment 1, Finding Nearby Differences

> Due Date: Wed, July 1st, 2015 00:00


**Section 1: Formal Problem Description**

> ∃ (i, j) ∈ ℤ {1..n} | ∀ (k, l) ∈ ℤ {1..n} | d(i, j) > d(k, l)

**Section 2: Algorithm**
> algorithm

>- input: an array of integers of size n, nums

>- output: i and j for maximum d(i,j) <- |a[i] - a[j]| / |i-j|

	algo <- nums

		max_i <- 0
		max_j <- 0
		max_d <- 0
		cur_d <- 0

		for i <- 1..length(nums)
			for j <- i..length(nums)

				cur_d <- d (i, j, nums)

				if cur_d > max_d
					max_i <- i
					max_j <- j
					max_d <- cur_d
				
		return max_i, max_j

> definition for d(i, j)

>- input: two integers i, j and an array of integers, nums

>- output: d(i,j) <- |a[i] - a[j]| / |i-j|

>- note: returns 0.0 when i == j to prevent / 0

	d <- i, j, nums

		if i == j
			return 0
		

		temp_a <- |nums[i] - nums[j]|
		temp_b <- |i - j|

		return temp_a / temp_b

**Section 3: Complexity**
> complexity
>- assuming the basic operation is the number of calls to d(i, j) that result in real computation, i.e. not the fail cases, we have complexity t[n] = n<sup>2</sup> - 2n.
>- considering the fact that d(i, j) will fail before it does any notable work given i = j the number of operations is more like (n)(n-1) - n. however due to caring about t[n] as n gets very large we can drop the -2n. this gives approximately t[n] = n<sup>2</sup>.
>- we can cut the algorithm down so it's (n-1)(n) with a second for loop that is smaller each time to prevent re-running d(i, j). this will not change the general complexity.
>- my algorithm is in the space of n<sup>2</sup> or O(n<sup>2</sup>)
>- my algorithm is measured against calls to d(i, j) which is called n<sup>2</sup> times due to the double nested loop that runs from 1 to n.

**Section 4: Correctness**

> the double nested loop of for( i [1:n]) { for( j [1:n]) { } } meets the requirement to check all possible combinations of a[i][j]. this allows me to check all d(i, j) values and compare them to previous d(i, j values) using the transitivity of of greater than and find the highest d(i, j) for the array of integers a. i store the current i and j values for the current highest d(i, j) and then return this at the end. they are only updated when d(i, j) exceeds the previous d(i, j). this shows that the algorithm gives the correct i and j values for the max d(i, j) for the integer array a. it also will fail out of any d(i, j) that would divide by 0 by returning 0.0 which will not affect the result.

**additional notes:**

> a link to a ruby script on my github that tests my algorithm
>- [assignment1.rb](https://github.com/The-Duchess/CS350-Summer2015/blob/master/assignment1.rb)
>- usage is ruby assignment1.rb [length of array]
