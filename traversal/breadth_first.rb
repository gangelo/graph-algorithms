#!/usr/bin/env ruby

require 'set'
require 'pry-byebug'

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

graph = {
  a: [:b, :c],
  b: [:d],
  c: [:e],
  d: [:f],
  e: [],
  f: [],
}

puts 'breadth-first iterative...'
breadth_first_iterative graph, :a
#=> a, b, c, d, e, f

puts 'breadth-first recursive...'
puts breadth_first_recursive(graph, :a).to_a.join("\n")
#=> a, b, d, f, c, e

puts 'done.'
