#!/usr/bin/env ruby

# frozen_string_literal: true

require 'set'
require_relative '../modules/graphs'


# Depth first
def depth_first_has_path?(graph, source, destination, visited = Set.new)
  visited << source

  puts "checking node #{source} to find path #{destination}..."
  return true if source == destination

  graph[source].each do |neighbor|
    next if visited.include? neighbor

    return true if depth_first_has_path?(graph, neighbor, destination, visited)
  end

  false
end

# Breadth first
def breadth_first_has_path?(graph, source, destination, visited = Set.new)
  queue = [source]

  while(queue.any?)
    current = queue.shift

    next if visited.include? current

    visited << current

    puts "checking node #{current} to find path #{destination}..."

    return true if current == destination

    graph[current].each do |neighbor|
      queue << neighbor
    end
  end

  false
end

graph = Graphs.has_path_graph

puts 'depth first...'
found_path = depth_first_has_path?(graph, :f, :k)
puts "found path?: #{found_path}"

puts 'breadth first...'
found_path = breadth_first_has_path?(graph, :f, :k)
puts "found path?: #{found_path}"
