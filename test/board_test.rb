require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/board.rb'
require './lib/ship.rb'

class BoardTest < Minitest::Test
  attr_reader :board

  def setup
    @board = Board.new
  end

  def test_it_exists
    assert_instance_of Board, board
  end

  def test_has_cells_hash
    assert_instance_of Hash, board.cells
  end

  def test_cells_hash_has_16_keys
    assert_equal 16, board.cells.keys.length
  end

  def test_can_tell_us_if_coord_is_on_board
    assert board.valid_coordinate?("A1")
  end

  def test_can_tell_us_if_coord_is_not_on_board
    assert !board.valid_coordinate?("Z1")
  end

  def test_can_tell_us_if_coords_same_length_as_ship
    ship = Ship.new("Big Boy", 2)
    coords = ["A1","A2"]
    assert board.valid_placement?(ship, coords)
  end

  def test_can_tell_us_if_coords_not_same_length_as_ship
    ship = Ship.new("Big Boy", 2)
    coords = ["A1"]
    assert !board.valid_placement?(ship, coords)
  end

  def test_can_tell_us_if_coords_are_consecutive
    ship = Ship.new("Big Boy", 2)
    coords = ["A1","A2","A3"]
    assert !board.valid_placement?(ship, coords)
  end
end
