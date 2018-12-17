require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/ship.rb'

class ShipTest < Minitest::Test
  attr_reader :ship

  def setup
    @ship = Ship.new("Big Bomber", 3)
  end

  def test_it_exists
      assert_instance_of Ship, ship
  end

  def test_it_has_a_name
    assert_equal "Big Bomber", ship.name
  end

  def test_it_has_length
    assert_equal 3, ship.length
  end

  def test_it_has_health
    assert_equal 3, ship.health
  end

  def test_if_it_is_initially_not_sunk
    assert_equal false, ship.sunk?
  end

  def test_hitting_lowers_health_by_one
    assert_equal 3, ship.health
    ship.hit
    assert_equal 2, ship.health
  end

  def test_ship_sinks_when_hits_more_than_health
    assert_equal 3, ship.health
    ship.hit
    ship.hit
    ship.hit
    assert_equal 0, ship.health
    assert_equal true, ship.sunk?
  end
end
