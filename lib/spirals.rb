class Spiral
  def initialize start_number, width
    @current_number = start_number
    @width = width
    @directions = ["R", "D", "L", "U"]
    @facing = "R"
    @cursor = [0,0]
  end

  def create_grid 
    @grid = Array.new

    blank_line = Array.new
    @width.times do 
      blank_line.push(Array.new)
    end

    (1..@width).each do 
      @grid.push(Array.new(@width){Array.new})
      # @grid.push(blank_line)
    end

    @grid2 = [[[],[],[]],[[],[],[]],[[],[],[]]]
  end

  def write_num
    p @grid
    # @grid[@cursor[0]][@cursor[1]] << @current_number

    @grid[0][0].push(1)
    @current_number += 1

    p @grid
  end



  def look_ahead
  end

  def set_direction
  end

  def move
  end
end

s = Spiral.new(1,3)
s.create_grid
s.write_num
