#! /usr/bin/env ruby
# Author: Isaac Archer
# Description:
# test for an algorithm to find the array intersect of two arrays of length n and m

def array_intersect(arr_a, arr_b)

      arr_c = []

      0.upto(arr_a.length - 1) do |i|
            0.upto(arr_b.length - 1) do |j|
                  if arr_a[i] == arr_b[j]
                        if arr_c.include? arr_a[i]
                              next
                        else
                              arr_c.push(arr_a[i])
                        end
                  end
            end
      end

      return arr_c
end

# input: array of arrays of integers
# output array of integers that is the intersect of the arrays in the input
def narray_intersect(arr_all)

      len_all = arr_all.length - 1
      arr_c = []

      0.upto(len_all) do |i|
            0.upto(len_all) do |j|
                  if i == j
                        next
                  else
                        temp_intersect = array_intersect(arr_all[i], arr_all[j])
                        p temp_intersect.to_s
                        p arr_c.to_s
                        temp_intersect.each do |k|
                              if arr_c.include? k
                                    next
                              else
                                    arr_c.push(k)
                                    p arr_c.to_s
                              end
                        end
                  end
            end
      end

end

def test_arr_all_int(num_arr, arr_len)

      arr_all = []

      0.upto(num_arr - 1) do |l|
            temp_arr = []
            0.upto(arr_len - 1) { |m| temp_arr.push(rand(arr_len) + 1) }
            arr_all.push(temp_arr)
            temp_arr = nil
      end

      i = 1

      arr_all.each do |a|
            print "ARRAY #{i}: "
            STDOUT.flush
            puts a.to_s
            i = i + 1
      end

      arr_c = narray_intersect(arr_all)

      print "INTERSECT ARRAY: "
      STDOUT.flush
      puts arr_c.to_s
end

def test_arr_int(len_a, len_b)

      arr_a = []
      arr_b = []

      0.upto(len_a - 1) { |i| arr_a.push(rand(len_a) + 1) }
      0.upto(len_b - 1) { |i| arr_b.push(rand(len_b) + 1) }

      print "ARRAY A: "
      STDOUT.flush
      puts arr_a.to_s

      print "ARRAY B: "
      STDOUT.flush
      puts arr_b.to_s

      arr_c = array_intersect(arr_a, arr_b)

      print "INTERSECT ARRAY: "
      STDOUT.flush
      puts arr_c.to_s

      return 0
end

def main()

      if ARGV.length != 2
            puts "invalid arguments"
            return 0
      end

      len_a = ARGV[0].to_i
      len_b = ARGV[1].to_i

      #test_arr_int(len_a, len_b)

      test_arr_all_int(len_a, len_b)
end

main
