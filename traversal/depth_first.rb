#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative '../modules/graphs'

# Interative

def depth_first_iterative(graph, source)
  return unless graph&.any?

  stack = [source]

 while(stack.any?) do
  current = stack.pop
  puts current

  graph[current].each do |neighbor|
    stack.push neighbor
  end
 end
end

# Recursive

def depth_first_recursive(graph, source)
  return unless graph&.any?

  puts source

  graph[source].each do |neighbor|
    depth_first_recursive graph, neighbor
  end
end

graph = Graphs.directed_simple_graph

puts 'depth-first iterative...'
depth_first_iterative graph, :a
#=> a, c, e, b, d, f

puts 'depth-first recursive...'
depth_first_recursive graph, :a
#=> a, b, d, f, c, e

puts 'done.'
