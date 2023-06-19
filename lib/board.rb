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

  def knight_moves(start = @root.position, dest)
    queue = [start]
    knight_root = node_from_address(start)
    knight_root.distance_from_start = 0
    until queue.empty?
      this_sq = node_from_address(queue.shift)
      this_sq.adjacent.each do |adj|
        child = node_from_address(adj)
        next unless child.distance_from_start.nil?

        child.parent = this_sq.position if child.parent.nil?
        child.distance_from_start = this_sq.distance_from_start + 1
        return "#{child.distance_from_start} steps here is the path #{get_path(child)}" if adj == dest

        queue.push(adj)
      end
    end
  end

  def get_path(node)
    path = []
    until node.parent.nil?
      path.unshift(node.position)
      node = node_from_address(node.parent)
    end
    path.unshift(node.position)
    return path
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
