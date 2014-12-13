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
    run
  end

  def create_grid
    grid = Array.new
    (1..@width).each do 
      grid.push(create_row)
    end
    grid
  end

  def create_row
    Array.new(@width) do
      Array.new
    end
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
      elsif not @grid[@cursor.row][@cursor.column + 1].empty?
        rotate
      end
    when "Down"
      if @grid[@cursor.row + 1].nil?
        rotate
      elsif not @grid[@cursor.row + 1][@cursor.column].empty?
        rotate
      end
    when "Left"
      if @grid[@cursor.row][@cursor.column - 1].nil?
        rotate
      elsif not @grid[@cursor.row][@cursor.column - 1].empty?
        rotate
      end
    when "Up"
      if @grid[cursor.row - 1].nil?
        rotate
      elsif not @grid[cursor.row - 1][cursor.column].empty?
        rotate
      end
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

  def print
    @text = ""
    @grid.each do |line|
      line.each do |number|
        @text << number.to_s.gsub(/\[|\]/,"").rjust(5)
      end
      @text << "\n"
    end
    @text
  end

  def run
    (@width ** 2).times do
      self.write_num
      self.look_ahead
      self.move
    end
    self.print
  end
end
