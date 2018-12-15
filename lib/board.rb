require './cell'

class Board
  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4")
    }
  end

  def valid_coordinate?(coord)
    @cells[coord] != nil
  end

  def cells
    @cells
  end

  def valid_placement?(ship, coords)
    if ship.length != coords.length
      false
    else
      true
    end
  end
end
