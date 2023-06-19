class Board
  require './square'
  require './knight'
  include Knight
  attr_accessor :root, :board

  def initialize
    @board = Array.new(LENGTH) { Array.new(WIDTH) }
    @root = Square.new(find_halfway(Knight::LENGTH, Knight::WIDTH))
  end

  def build_board
    LENGTH.times { |idx| WIDTH.times { |jdx| @board[idx][jdx] = Square.new([idx, jdx]) } }
  end

  def knight_moves(dest, start = @root.position, stack = [start], path = {})
    return path if stack.empty?

    path[co_ord_to_sym(stack.last)] = 'yes'
    p path
    this_add = stack.last
    return path if this_add == dest

    current_vertex = node_from_address(this_add)
    current_vertex.adjacent.each do |adj_addr|
      next if path.include?(co_ord_to_sym(adj_addr))

      stack.push(adj_addr)
      knight_moves(dest, adj_addr, stack, path)
    end
  end

  def node_from_address(co_ord)
    x = co_ord[0]
    y = co_ord[1]
    @board[x][y]
  end

  def find_halfway(x, y)
    new_y = (y / 2.0).round
    new_x = (x / 2.0).round
    [new_x, new_y]
  end

  def co_ord_to_sym(co_ord)
    co_ord.to_s.to_sym
  end
end
