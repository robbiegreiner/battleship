class Cell
  attr_reader :coordinate,
              :ship,
              :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if @ship != nil
      @ship.hit
    end
    @fired_upon = true
  end

  def place_ship(ship)
    @ship = ship
  end

  def render(bool = false)
    if bool && @ship
      "S"
    elsif @fired_upon && !@ship
      "M"
    elsif @fired_upon && @ship
      "H"
    elsif @fire_upon && @ship.sunk?
      "X"
    else
      "."
    end
  end

end
