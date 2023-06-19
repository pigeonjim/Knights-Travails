class Square
  require './knight'
  include Knight
  attr_accessor :position, :adjacent, :distance_from_start, :parent

  def initialize(position)
    @position = position
    @adjacent = []
    @distance_from_start = nil
    @parent = nil
    possible_moves
  end

  def possible_moves
    Knight.method_ary.each do |method|
      next_add = method.call(@position).nil? ? next : method.call(@position)
      @adjacent.push(next_add)
    end
  end
end
