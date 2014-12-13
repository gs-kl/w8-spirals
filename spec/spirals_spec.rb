require_relative '../lib/spirals.rb'

describe "Spiral class initialized with start number 1, width 3" do
  it "creates the appropriate grid" do
    spiral = Spiral.new 1,3
    output = spiral.print.to_s
    expect(output).to eq("[[[], [], []], [[], [], []], [[], [], []]]")
  end

  it "writes the first number" do
    spiral = Spiral.new 1,3
    spiral.write_num
    output = spiral.print.to_s
    expect(output).to eq("[[[1], [], []], [[], [], []], [[], [], []]]")
  end

  it "writes the first number, looks ahead, and does not rotate" do
spiral = Spiral.new 1,3
   spiral.write_num
    spiral.look_ahead
    output = spiral.direction
    expect(output).to eq("Right")
end

  it "writes the first number, looks ahead, and does not rotate, and moves" do
spiral = Spiral.new 1,3
    spiral.write_num
    spiral.look_ahead
    spiral.move
    output = spiral.cursor
    expect(output).to eq(1)
end


end



=begin
1 2
4 3

1  2  3
8  9  4
7  6  5

  1    2    3    4
 12   13   14    5
 11   16   15    6
 10    9    8    7

=end
