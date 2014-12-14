require_relative '../lib/spirals.rb'

=begin
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
=end

describe "Spiral class" do
  it "returns the correct output for 3 width, starting at 1" do
    output = Spiral.new(1,4).return.chomp
    expected_output="  1    2    3    4
 12   13   14    5
 11   16   15    6
 10    9    8    7"
    expect(output).to eq(expected_output)
  end

  it "returns the correct output for 5 width, starting at 3" do
    output = Spiral.new(3,5).return.chomp
    expected_output="  3    4    5    6    7
 18   19   20   21    8
 17   26   27   22    9
 16   25   24   23   10
 15   14   13   12   11"
    expect(output).to eq(expected_output)
  end

  it "returns the correct output for 10 width, starting at 10" do
  output = Spiral.new(10,10).return.chomp
expected_output=" 10   11   12   13   14   15   16   17   18   19
 45   46   47   48   49   50   51   52   53   20
 44   73   74   75   76   77   78   79   54   21
 43   72   93   94   95   96   97   80   55   22
 42   71   92  105  106  107   98   81   56   23
 41   70   91  104  109  108   99   82   57   24
 40   69   90  103  102  101  100   83   58   25
 39   68   89   88   87   86   85   84   59   26
 38   67   66   65   64   63   62   61   60   27
 37   36   35   34   33   32   31   30   29   28"
  end

end
