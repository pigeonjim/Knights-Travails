require './board'
require './knight'
include Knight

b = Board.new
b.build_board
b.knight_moves([3, 2])

