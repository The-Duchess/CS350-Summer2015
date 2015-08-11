#! /usr/bin/env ruby

class Union_Find
      def initialize
            @edges = []
      end

      def add_edge(edge)
            @edges.push(edge)
      end

      def path_exists?(v_a, v_b, vertices)
            # if a path exists between v_a and v_b return true
      end

      def connected(v_a, v_b, vertices)

            @edges.each { |v| if v[:start] == v_a and v[:end] == v_b then return false end }

            if self.path_exists?(v_a, v_b)
                  return true
            end

            return false
      end

      def union(v_a, v_b)
            edge_1, edge_2 = @edges[:v_a], @edges[:v_b]
            @edges.map! { |i| (i == edge_1) ? edge_2 : i }
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
      if not set_V.connected(edge[:start], edge[:end], vertexes)
            min_tree.push(edge)
            set_V.union(edge[:start], edge[:end])
      end
end

puts min_tree
