#! /usr/bin/env ruby

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

      print "ARRAY B: "
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

      test_arr_int(len_a, len_b)
end

main
