#!/usr/bin/env ruby

# frozen_string_literal: true

require 'set'
require_relative '../modules/graphs'

# Interative

def breadth_first_iterative(graph, source)
  return unless graph&.any?

  queue = [source]

  while(queue.any?) do
    current = queue.shift
    puts current

    graph[current].each do |neighbor|
      queue << neighbor
    end
  end
end

# Recursive

def breadth_first_recursive(graph, node, visited = Set.new)
  visited << node

  graph[node].each do |neighbor|
    next if visited.include?(neighbor)

    breadth_first_recursive(graph, neighbor, visited)
  end

  visited
end

graph = Graphs.directed_simple_graph

puts 'breadth-first iterative...'
breadth_first_iterative graph, :a
#=> a, b, c, d, e, f

puts 'breadth-first recursive...'
puts breadth_first_recursive(graph, :a).to_a.join("\n")
#=> a, b, d, f, c, e

puts 'done.'
