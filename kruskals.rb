#! /usr/bin/env ruby

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
                              return true
                        end

                        if !done.include? t
                              to_do.push(t)
                        end
                  end

                  len = len + 1

                  puts to_do
            end

            if len > 1 then return false end


            return true
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
      puts edge
      if !set_V.connected(edge[:start], edge[:end])
            min_tree.push(edge)
            set_V.union(edge, edge)
      end
end

puts min_tree
