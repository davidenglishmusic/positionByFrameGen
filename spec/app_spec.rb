require_relative '../app'

describe PositionByFrameGen do

  before :all do
    @testObject001 = PositionByFrameGen.new([0,0],[10,10],0,10)
    @testObject002 = PositionByFrameGen.new([0,0],[10,-10],0,10)
    @testObject003 = PositionByFrameGen.new([0,0],[-10,10],0,10)
    @testObject004 = PositionByFrameGen.new([0,0],[-10,-10],0,10)
    @testObject005 = PositionByFrameGen.new([2,7],[-8,-1],0,10)
  end

  describe "calculateMidpoint" do
    it "returns [5,5] when the starting coordinates are [0,0] and the end coordinates are [10,10]" do
      expect(@testObject001.calculateMidpoint()).to eq([5,5])
    end
    it "returns [-3,3] when the starting coordinates are [2,7] and the end coordinates are [-8,-1]" do
      expect(@testObject005.calculateMidpoint()).to eq([-3,3])
    end
  end

  describe "calculateY" do
    it "returns 0 when x is 0" do
      expect(@testObject001.calculateY(0)).to eq(0)
    end
    it "returns 10 when x is 10" do
      expect(@testObject001.calculateY(10)).to eq(10)
    end
    it "returns 5 when x is 5" do
      expect(@testObject001.calculateY(5)).to eq(5)
    end
  end

  describe "getAllFrameCoordinates" do
    it "returns an array of each frame and it's coordinates when the starting coordinates are [0,0] and the end coordinates are [10,10]" do
      expect(@testObject001.getAllFrameCoordinates()).to eq([[0, [0, 0]], [1, [1, 0.24471741852423268]], [2, [2, 0.9549150281252627]], [3, [3, 2.061073738537634]], [4, [4, 3.4549150281252627]], [5, [5, 5.0]], [6, [6, 6.545084971874737]], [7, [7, 7.938926261462366]], [8, [8, 9.045084971874736]], [9, [9, 9.755282581475768]], [10, [10, 10]]])
    end
    it "returns an array of each frame and it's coordinates when the starting coordinates are [0,0] and the end coordinates are [10,-10]" do
      expect(@testObject002.getAllFrameCoordinates()).to eq([[0, [0, 0]], [1, [1.0, -0.2447174185242318]], [2, [2.0, -0.9549150281252636]], [3, [3.0, -2.061073738537634]], [4, [4.0, -3.4549150281252627]], [5, [5.0, -5.0]], [6, [6.0, -6.545084971874737]], [7, [7.0, -7.938926261462366]], [8, [8.0, -9.045084971874736]], [9, [9.0, -9.755282581475768]], [10, [10, -10]]])
    end
    # it "returns an array of each frame and it's coordinates when the starting coordinates are [2,7] and the end coordinates are [-8,-1]" do
    #   expect(@testObject005.getAllFrameCoordinates()).to eq([[0, [2, 7]], [1, [1.0, 6.804226065180615]], [2, [0.0, 6.23606797749979]], [3, [-1.0, 5.3511410091698925]], [4, [-2.0, 4.23606797749979]], [5, [-3.0, 3.0]], [6, [-4.0, 1.7639320225002104]], [7, [-5.0, 0.6488589908301075]], [8, [-6.0, -0.2360679774997898]], [9, [-7.0, -0.8042260651806141]], [10, [-8, -1]]])
    # end
    # it "returns an array of each frame and it's coordinates when the starting coordinates are [0,0] and the end coordinates are [-10,-10]" do
    #   expect(@testObject004.getAllFrameCoordinates()).to eq([[0, [0, 0]], [1, [-1.0, -0.2447174185242318]], [2, [-2.0, -0.9549150281252627]], [3, [-3.0, -2.0610737385376336]], [4, [-4.0, -3.4549150281252627]], [5, [-5.0, -4.999999999999999]], [6, [-6.0, -6.545084971874736]], [7, [-7.0, -7.938926261462365]], [8, [-8.0, -9.045084971874736]], [9, [-9.0, -9.755282581475768]], [10, [-10, -10]]])
    # end
  end

end
