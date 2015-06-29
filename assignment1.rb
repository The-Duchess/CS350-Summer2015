#! /bin/env ruby-2.1
# CS350 RUBY ASSIGNMENT 01
# Author: Isaac Archer


$ops = 0 # incremented on each time d(i, j) is run

# input: an array of integers of size n
# output: i and j for maximum d(i,j) = |a[i] - a[j]| / |i-j|
def algo(nums)

	max_i = 0 # current i for highest d(i,j)
	max_j = 0 # current j for highest d(i,j)
	max_d = 0.0 # current maximum result from d(i, j)
	cur_d = 0.0 # current d(i, j)

	len = nums.length - 1

	0.upto(len) do |i|
		0.upto(len) do |j|
			cur_d = d(i, j, nums)

			if cur_d > max_d
				max_i = i
				max_j = j
				max_d = cur_d
			end
		end
	end

	output = [max_i, max_j];

	return output

end

# d(i,j) = |a[i] i a[j]| / |i-j|
# input: two integers and an array
# output: |a[i] - a[j]| / |i-j|
def d(i, j, nums)

	# cannot divide when i = j
	if i == j
		return 0.0
	end

	temp_i = 0.0
	temp_j = 0.0

	temp_i = sub_a(nums[i], nums[j]).to_f
	temp_j = sub_a(i, j).to_f

	temp_r = 0.0

	temp_r = (temp_i/temp_j)

	$ops += 1

	return temp_r

end

# input: two integers i, j
# output: |i - j|
def sub_a(i, j)

	output = i - j

	if output < 0
		output = j - i
		return output
	end

	return output

end

# main
def main()

	arrlen = ARGV[0].to_i

	input = []

	0.upto(arrlen - 1) do |i|
		input.push(rand(arrlen/2))
	end

	output = algo(input)

	print "input = "
	STDOUT.flush
	input.each { |i| print "#{i} "; STDOUT.flush; }
	puts ""
	puts "input size: #{arrlen}"
	puts "number of ops: #{$ops}"
	puts "max i: #{output[0]}"
	puts "max j: #{output[1]}"

end

main
