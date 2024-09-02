class Board
  attr_reader :positions

  def initialize
    @positions = Array.new(7, Array.new(7))
  end

  private

  attr_writer :positions

end
