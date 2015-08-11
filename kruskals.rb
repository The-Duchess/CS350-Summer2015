#! /usr/bin/env ruby

class Union_Find
      def initialize
            @vertices = {}
      end

      def add_edge(n, sp, ep)
            @vertices.store("#{sp}#{ep}", n.to_i)
      end

      def connected(v_a, v_b)
            t_a = "#{v_a[:start]}#{v_b[:end]}"
            t_b = "#{v_b[:start]}#{v_b[:end]}"

            if @vertices[:t_a] == @vertices[:t_b]
                  return true
            end

            return false
      end

      def union(v_a,v_b)
            t_a = "#{v_a[:start]}_#{v_a[:end]}"
            t_b = "#{v_b[:start]}_#{v_b[:end]}"

            vertex_1, vertex_2 = @vertices[:t_a], @vertices[:t_b]
            return @vertices.map! { |i| (i == vertex_1) ? vertex_2 : i }
      end
end

file = File.readlines("city-pairs.txt")

lines = file.map { |fr| fr.split("\n").map(&:to_s) }

set_V = Union_Find.new

edges = []

i = 0

lines.each do |line|
      t_tokens = line[0].split(" ").map(&:to_s)
      t_edge = { :start => t_tokens[0], :end => t_tokens[1], :length => t_tokens[2].to_i }
      edges.push(t_edge)
      set_V.add_edge(i, t_edge[:start], t_edge[:end])
      i += 1
end

i = 0

edges.sort_by! { |v| v[:length] }

edges.each { |edge| puts edge }

min_tree = []

edges.each do |edge|
      if not set_V.connected(edge[:start], edge[:end])
            min_tree.push(edge)
            set_V.union(edge[:start], edge[:end])
      end
end

puts min_tree
