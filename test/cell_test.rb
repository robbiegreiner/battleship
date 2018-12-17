require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/cell.rb'
require './lib/ship.rb'

class CellTest < Minitest::Test
  attr_reader :cell

  def setup
    @cell = Cell.new("B4")
  end

  def test_it_exists
    assert_instance_of Cell, cell
  end

  def test_it_has_coordinate
    assert_equal "B4", cell.coordinate
  end

  def test_it_starts_out_without_ship
    assert_nil cell.ship
  end

  def test_its_starts_not_fired_upon
    assert_equal false, cell.fired_upon
  end

  def test_empty_check
    assert_equal true, cell.empty?
  end

  def test_fired_upon_check
    assert_equal false, cell.fired_upon?
  end

  def test_firing_upon_registers
    cell.fire_upon
    assert_equal true, cell.fired_upon?
  end

  def test_placing_a_ship
    my_ship = Ship.new("Bruiser", 3)
    cell.place_ship(my_ship)
    assert cell.ship, my_ship
  end

  def test_ship_should_be_damaged_on_fire_upon
    my_ship = Ship.new("Bruiser", 3)
    cell.place_ship(my_ship)
    assert cell.ship, my_ship
    assert_equal 3, my_ship.health
    cell.fire_upon
    assert_equal 2, my_ship.health
  end

  def test_render_if_no_ship
    assert_equal ".", cell.render
  end

  def test_render_if_ship
    my_ship = Ship.new("Bruiser", 3)
    cell.place_ship(my_ship)
    assert_equal ".", cell.render
  end

  def test_render_if_ship_and_user_passes_true
    my_ship = Ship.new("Bruiser", 3)
    cell.place_ship(my_ship)
    assert_equal "S", cell.render(true)
  end

  def test_render_if_no_ship_and_fired_upon
    cell.fire_upon
    assert_equal "M", cell.render
  end

  def test_render_if_ship_and_fired_upon
    my_ship = Ship.new("Bruiser", 3)
    cell.place_ship(my_ship)
    cell.fire_upon
    assert_equal "H", cell.render
  end

  def test_render_if_ship_sunk
    my_ship = Ship.new("Bruiser", 3)
    cell.place_ship(my_ship)
    cell.fire_upon
    cell.fire_upon
    cell.fire_upon
    assert_equal "X", cell.render
  end

end
