#! /usr/bin/env ruby

class Union_Find
      def initialize(length)
            @vertices = (0..length).to_a
      end

      def connected(v_1, v_2)
            if @vertices[v_1] == @vertices[v_2]
                  return true
            end

            return false
      end

      def union(v_1,v_2)
            vertex_1, vertex_2 = @vertices[v_1], @vertices[v_2]
            @vertices.map! {|i| (i == vertex_1) ? vertex_2 : i }
      end
end

file = File.readlines("city-pairs.txt")

lines = file.map { |fr| fr.split("\n").map(&:to_s) }

edges = []

lines.each do |line|
      t_tokens = line[0].split(" ").map(&:to_s)
      t_edge = { :start => t_tokens[0], :end => t_tokens[1], :length => t_tokens[2] }
      p t_edge
      edges.push(t_edge)
end

edges.sort_by { |v| v[:length].to_i }

set_V = Union_Find.new(lines.length - 1)

min_tree = []

edges.each do |edge|
      if not set_V.connected(edge[:start], edge[:end])
            min_tree.push(edge)
            set_V.union(edge[:start], edge[:end])
      end
end

puts min_tree
