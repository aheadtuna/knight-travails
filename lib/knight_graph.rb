require_relative 'node'

class KnightGraph
  attr_accessor :root, :visited_positions

  def initialize(position)
    @visited_positions = {}
    @root = build_graph(position)
  end

  def build_graph(position) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    return nil unless on_board?(position)
    return nil if @visited_positions[position] # Avoid revisiting nodes

    node = Node.new(position)
    @visited_positions[position] = node # Mark position as visited

    y = position[0]
    x = position[1]

    possible_moves = [
      [y - 1, x - 2], [y + 1, x - 2],
      [y - 1, x + 2], [y + 1, x + 2],
      [y + 2, x - 1], [y + 2, x + 1],
      [y - 2, x + 1], [y - 2, x - 1]
    ]

    node.nextnodes = possible_moves.map { |new_position| build_graph(new_position) }.compact

    node
  end

  def check(graph)
    until graph.nil?
      p graph.nextnodes << "s"
      graph = graph.nextnodes[1]
    end
  end

  def on_board?(position)
    position.all? { |axis| axis.between?(0, 7) }
  end
end

k = KnightGraph.new([3, 3])
p k.root
