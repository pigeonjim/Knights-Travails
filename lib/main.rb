require './board'
require './knight'
include Knight

b = Board.new
b.build_board
puts b.knight_moves([7,2], [0, 0])
