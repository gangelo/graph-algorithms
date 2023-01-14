# frozen_string_literal: true

module Graphs
  module_function

  def directed_simple_graph
    @directed_simple_graph ||= {
      a: [:b, :c],
      b: [:d],
      c: [:e],
      d: [:f],
      e: [],
      f: [],
    }
  end

  def has_path_graph
    @has_path_graph ||= {
      f: [:g, :i],
      g: [:h],
      h: [],
      i: [:g, :k],
      j: [:i],
      k: [],
    }
  end
end
