class Node
  attr_accessor :vertex, :nextnodes

  def initialize(vertex = nil)
    @vertex = vertex
    @nextnodes = []
  end
end
