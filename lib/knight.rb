module Knight
  attr_reader :method_ary
  
  LENGTH = 8
  WIDTH = 8
  @arry_width = (WIDTH - 1)
  @arry_length = (LENGTH - 1)
  # move is one step up then two steps right
  move_one = ->(position) { [position[0] + 1, position[1] + 2] unless (position[0] + 1) > @arry_length || (position[1] + 2) > @arry_width }
  # move is one step down then two steps right
  move_two = ->(position) { [position[0] - 1, position[1] + 2] unless (position[0] - 1).negative? || (position[1] + 2) > @arry_width }
  # move is one step up then two steps left
  move_three = ->(position) { [position[0] + 1, position[1] - 2] unless (position[0] + 1) > @arry_length || (position[1] - 2).negative?}
  # move is one step down then two steps left
  move_four = ->(position) { [position[0] - 1, position[1] - 2] unless (position[0] - 1).negative? || (position[1] + 2) > @arry_width }
  # move is two steps up then one step right
  move_five = ->(position) { [position[0] + 2, position[1] + 1] unless (position[0] + 2) > @arry_length || (position[1] + 1) > @arry_width }
  # move is two steps down then one step right
  move_six = ->(position) { [position[0] - 2, position[1] + 1] unless (position[0] - 2).negative? || (position[1] + 1) > @arry_width }
  # move is two steps up then one step left
  move_seven = ->(position) { [position[0] + 2, position[1] - 1] unless (position[0] + 2) > @arry_length || (position[1] - 1).negative? }
  # move is two steps down then one step left
  move_eight = ->(position) { return [position[0] - 2, position[1] - 1] unless (position[0] - 2).negative? || (position[1] - 1).negative? }
  @method_ary = [move_one, move_two, move_three, move_four, move_five, move_six, move_seven, move_eight]
end
