#! /usr/bin/env ruby

class Union_Find
      def initialize(length)
            @vertices = Array.new(size=length.to_i)
      end

      def connected(v_1, v_2)
            if @vertices[v_1] == @vertices[v_2]
                  return true
            end

            return false
      end

      def union(v_1,v_2)
            vertex_1, vertex_2 = @vertices[v_1], @vertices[v_2]
            @vertices.map! {|i| (i == leader_1) ? leader_2 : i }
      end
end

file = File.readlines("city-pairs.txt")

lines = file.split("\n")

edges = lines.each { |line| line.split(" ").map(&:to_s) }.map { |start_p, end_p, length| { :start_p => from, :end_p => to, :length => length } }.sort_by { |v| v[:length].to_i }

set_V = Union_find.new(lines.length - 1)

min_tree = []

edges.each do |edge|
      if not set_V.connected(edge[:start_p], edge[:end_p])
            min_tree.push(edge)
            set_V.union(edge[:start_p], edge[:end_p])
      end
end

puts min_tree
