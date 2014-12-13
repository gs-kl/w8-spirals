class Cursor
  attr_accessor :column, :row

  def initialize
    @column = 0
    @row = 0
  end
end

class Spiral
  attr_accessor :direction, :cursor, :grid

  def initialize start_number, width
    @current_number = start_number
    @width = width
    @direction = "Right"
    @cursor = Cursor.new
    @grid = create_grid
  end

  def create_grid
    grid = Array.new
    (1..@width).each do 
      grid.push(Array.new(@width){Array.new})
    end
    grid
  end

  def write_num
    @grid[cursor.row][cursor.column] << @current_number
    @current_number += 1
  end

  def look_ahead
    case @direction
    when "Right"
      if @grid[@cursor.row][@cursor.column + 1].nil?
        rotate
      elsif @cursor.column + 1 == @width
        rotate
      end
    when "Down"
      if @grid[@cursor.row + 1].nil?
        rotate
        print "ASLDKALSKD"
      elsif @cursor.row + 1 == @width
        rotate
        print "QWEQWE"
      end
    when "Left"
      if @grid[@cursor.row][@cursor.column - 1].nil?
        rotate
      elsif @cursor.column - 1 < 0
        rotate
      end
    when "Up"
      rotate if @cursor.column - 1 < 0
    end
  end

  def rotate
    directions = ["Right", "Down", "Left", "Up"]
    @direction = directions[(directions.index(@direction) + 1) % 4]
  end

  def move
    case @direction
    when "Right"
      @cursor.column = @cursor.column.next
    when "Down"
      @cursor.row = @cursor.row.next
    when "Left"
      @cursor.column = @cursor.column.pred
    when "Up"
      @cursor.row = @cursor.row.pred
    end
  end

  # def print
  #   p @grid
  # end

  def run
    self.write_num
    self.look_ahead
    self.move
  end

end




spiral = Spiral.new(1,3)

9.times do
  p spiral.cursor.row
  spiral.run
  p spiral.direction
  # spiral.print
  p spiral.grid
end

