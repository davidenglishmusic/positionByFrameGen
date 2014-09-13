require_relative '../app'

describe PositionByFrameGen do

  before :all do
    @testObject = PositionByFrameGen.new([0,0],[10,10],0,10)
  end

  describe "calculateY" do
    it "returns 0 when x is 0" do
      expect(@testObject.calculateY(0)).to eq(0)
    end
    it "returns 5 when x is 5" do
      expect(@testObject.calculateY(5)).to eq(5)
    end
  end

  describe "getAllFrameCoordinates" do
    it "returns an array of each frame and it's coordinates" do
      expect(@testObject.getAllFrameCoordinates()).to eq([[0, [0, 0]], [1, [1, 0.24471741852423268]], [2, [2, 0.9549150281252627]], [3, [3, 2.061073738537634]], [4, [4, 3.4549150281252627]], [5, [5, 5.0]], [6, [6, 6.545084971874737]], [7, [7, 7.938926261462366]], [8, [8, 9.045084971874736]], [9, [9, 9.755282581475768]], [10, [10, 10]]])
    end
  end

end
