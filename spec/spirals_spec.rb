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

  it "has the correct output for " do

  end


end


