# **Assignment 1**
> Author: Isaac Archer

> Name: Assignment 1, Finding Nearby Differences

> Due Date: Wed, July 1st, 2015 00:00


**Section 1: Formal Problem Description**

max d(i, j) for all values i, j in 1 to n where n is the length of
the array of integers, a, such that d(i, j) = d(i,j) <- |a[i] - a[j]| / |i-j|

**Section 2: Algorithm**
> algorithm

>- input: an array of integers of size n

>- output: i and j for maximum d(i,j) <- |a[i] - a[j]| / |i-j|

def algo (nums) {

	max_i <- 0
	max_j <- 0
	max_d <- 0.0
	cur_d <- 0.0

	len <- nums.length - 1

	0.upto (len) { |i|
		0.upto (len) { |j|

			cur_d <- d (i, j, nums)

			if cur_d > max_d {
				max_i <- i
				max_j <- j
				max_d <- cur_d
			}
		}
	}

	return ++max_i, ++max_j // increment to provide base 1 array indeces

}

> definition for d(i, j)

>- input: two integers i, j and an array of integers, nums

>- output: d(i,j) <- |a[i] - a[j]| / |i-j|

>- note: returns 0.0 when i == j to prevent / 0

def d (i, j, nums) {

	if i == j {
		return 0.0
	}

	temp_a <- |nums[i] - nums[j]|
	temp_b <- |i - j|

	return temp_a / temp_b

}

**Section 3: Complexity**
> complexity
>- my algorithm is in the space of n<sup>2</sup> or O(n<sup>2</sup>)
>- my algorithm is measured against calls to d(i, j) which is called n<sup>2</sup> times due to the double nested loop that runs from 1 to n.

**Section 4: Correctness**

> the double nested loop of for( i [1:n]) { for( j [1:n]) { } } meets the

> requirement to check all possible combinations of a[i][j]. this allows me

> to check all d(i, j) values and compare them to previous d(i, j values) using

> the transitivity of of greater than and find the highest d(i, j) for the array

> of integers a. i store the current i and j values for the current highest

> d(i, j) and then return this at the end. they are only updated when d(i, j)

> exceeds the previous d(i, j). this shows that the algorithm gives the correct

> i and j values for the max d(i, j) for the integer array a. it also will fail

> out of any d(i, j) that would divide by 0 by returning 0.0 which will not

> affect the result.