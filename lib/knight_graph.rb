require_relative 'node'

class KnightGraph
  attr_reader :root

  def initialize(root_position)
    @root = build_graph(root_position)
  end

  def build_graph(position) # rubocop:disable Metrics/AbcSize
    return nil unless on_board?(position)

    node = Node.new(position)
    y = position[0]
    x = position[1]

    node.nextnodes = [build_graph([y - 1, x - 2]), build_graph([y + 1, x - 2]),
                      build_graph([y - 1, x + 2]), build_graph([y + 1, x + 2]),
                      build_graph([y + 2, x - 1]), build_graph([y + 2, x + 1]),
                      build_graph([y - 2, x + 1]), build_graph([y - 2, x - 1])]

    node
  end

  def on_board?(position)
    position.each do |axes|
      return false if axes > 7 || axes.negative?
    end
    true
  end
end

k = KnightGraph.new([3, 3])
p k.root
