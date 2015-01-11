require_relative '../app'

describe PositionByFrameGen do

  before :all do
    @test_object_001 = PositionByFrameGen.new([0, 0], [10, 10], 0, 10)
    @test_object_002 = PositionByFrameGen.new([0, 0], [10, -10], 0, 10)
    @test_object_003 = PositionByFrameGen.new([0, 0], [-10, 10], 0, 10)
    @test_object_004 = PositionByFrameGen.new([0, 0], [-10, -10], 0, 10)
    @test_object_005 = PositionByFrameGen.new([2, 7], [-8, -1], 0, 10)
    @test_object_006 = PositionByFrameGen.new([2, 7], [8, 1], 0, 10)
    @test_object_007 = PositionByFrameGen.new([0, 0], [0, -10], 0, 10)
    @test_object_008 = PositionByFrameGen.new([0, 0], [0, 10], 0, 10)
    @test_object_009 = PositionByFrameGen.new([0, 0], [0, 0], 0, 10)
    @test_object_010 = PositionByFrameGen.new([-3, 3], [3, 3], 0, 10)
    @test_object_011 = PositionByFrameGen.new([0, 3], [-10, 3], 0, 10)
    @test_object_012 = PositionByFrameGen.new([-3, -3], [3, 1], 0, 5)
    @test_object_013 = PositionByFrameGen.new([-5, -5], [3, 3], 0, 10)
    @test_object_014 = PositionByFrameGen.new([3, 3], [-5, -5], 0, 10)
    @test_object_015 = PositionByFrameGen.new([-1, -1], [-5, -5], 0, 10)
    @test_object_016 = PositionByFrameGen.new([1, -1], [5, -5], 0, 10)
    @test_object_017 = PositionByFrameGen.new([3, 2], [3, 3], 0, 10)
    @test_object_018 = PositionByFrameGen.new([3, 3], [3, 2], 0, 10)
  end

  describe "calculate_absolute_distance" do
    it "returns 8 when the starting coordinate is -5 and the ending coordinate is 3" do
      expect(@test_object_001.calculate_absolute_distance(-5, 3)).to eq(8)
    end
  end

  describe "calculate_midpoint" do
    it "returns [5,5] when the starting coordinates are [0,0] and the end coordinates are [10,10]" do
      expect(@test_object_001.calculate_midpoint).to eq([5,5])
    end
    it "returns [-3,3] when the starting coordinates are [2,7] and the end coordinates are [-8,-1]" do
      expect(@test_object_005.calculate_midpoint).to eq([-3,3])
    end
    it "returns [-1,-1] when the starting coordinates are [-5,-5] and the end coordinates are [3,3]" do
      expect(@test_object_013.calculate_midpoint).to eq([-1,-1])
    end
    it "returns [-1,-1] when the starting coordinates are [3,3] and the end coordinates are [-5,-5]" do
      expect(@test_object_014.calculate_midpoint).to eq([-1,-1])
    end
    it "returns [-3,-3] when the starting coordinates are [-1,-1] and the end coordinates are [-5,-5]" do
      expect(@test_object_015.calculate_midpoint).to eq([-3,-3])
    end
    it "returns [3,-3] when the starting coordinates are [1,-1] and the end coordinates are [5,-5]" do
      expect(@test_object_016.calculate_midpoint).to eq([3,-3])
    end
  end

  describe "calculate_y" do
    it "returns 0 when x is 0" do
      expect(@test_object_001.calculate_y(0)).to eq(0)
    end
    it "returns 10 when x is 10" do
      expect(@test_object_001.calculate_y(10)).to eq(10)
    end
    it "returns 5 when x is 5" do
      expect(@test_object_001.calculate_y(5)).to eq(5)
    end
  end

  describe "get_all_frame_coordinates" do
    it "returns an array of each frame and it's coordinates when the starting coordinates are [0,0] and the end coordinates are [10,10]" do
      expect(@test_object_001.get_all_frame_coordinates).to eq([[0, [0, 0]], [1, [1, 0.24471741852423268]], [2, [2, 0.9549150281252627]], [3, [3, 2.061073738537634]], [4, [4, 3.4549150281252627]], [5, [5, 5.0]], [6, [6, 6.545084971874737]], [7, [7, 7.938926261462366]], [8, [8, 9.045084971874736]], [9, [9, 9.755282581475768]], [10, [10, 10]]])
    end
    it "returns an array of each frame and it's coordinates when the starting coordinates are [0,0] and the end coordinates are [10,-10]" do
      expect(@test_object_002.get_all_frame_coordinates).to eq([[0, [0, 0]], [1, [1.0, -0.24471741852423268]], [2, [2.0, -0.9549150281252627]], [3, [3.0, -2.061073738537634]], [4, [4.0, -3.4549150281252627]], [5, [5.0, -5.0]], [6, [6.0, -6.545084971874737]], [7, [7.0, -7.938926261462366]], [8, [8.0, -9.045084971874736]], [9, [9.0, -9.755282581475768]], [10, [10, -10]]])
    end
    it "returns an array of each frame and it's coordinates when the starting coordinates are [0,0] and the end coordinates are [-10,10]" do
      expect(@test_object_003.get_all_frame_coordinates).to eq([[0, [0, 0]], [1, [-1.0, 0.24471741852423268]], [2, [-2.0, 0.9549150281252627]], [3, [-3.0, 2.061073738537634]], [4, [-4.0, 3.4549150281252627]], [5, [-5.0, 5.0]], [6, [-6.0, 6.545084971874737]], [7, [-7.0, 7.938926261462366]], [8, [-8.0, 9.045084971874736]], [9, [-9.0, 9.755282581475768]], [10, [-10, 10]]])
    end
    it "returns an array of each frame and it's coordinates when the starting coordinates are [0,0] and the end coordinates are [-10,-10]" do
      expect(@test_object_004.get_all_frame_coordinates).to eq([[0, [0, 0]], [1, [-1.0, -0.24471741852423268]], [2, [-2.0, -0.9549150281252627]], [3, [-3.0, -2.061073738537634]], [4, [-4.0, -3.4549150281252627]], [5, [-5.0, -5.0]], [6, [-6.0, -6.545084971874737]], [7, [-7.0, -7.938926261462366]], [8, [-8.0, -9.045084971874736]], [9, [-9.0, -9.755282581475768]], [10, [-10, -10]]])
    end
    it "returns an array of each frame and it's coordinates when the starting coordinates are [2,7] and the end coordinates are [-8,-1]" do
      expect(@test_object_005.get_all_frame_coordinates).to eq([[0, [2, 7]], [1, [1.0, 6.804226065180615]], [2, [0.0, 6.23606797749979]], [3, [-1.0, 5.3511410091698925]], [4, [-2.0, 4.23606797749979]], [5, [-3.0, 3.0]], [6, [-4.0, 1.7639320225002104]], [7, [-5.0, 0.6488589908301075]], [8, [-6.0, -0.2360679774997898]], [9, [-7.0, -0.8042260651806141]], [10, [-8, -1]]])
    end
    it "returns an array of each frame and it's coordinates when the starting coordinates are [2,7] and the end coordinates are [8,1]" do
      expect(@test_object_006.get_all_frame_coordinates).to eq([[0, [2, 7]], [1, [2.6, 6.85316954888546]], [2, [3.2, 6.4270509831248415]], [3, [3.8000000000000003, 5.763355756877418]], [4, [4.4, 4.9270509831248415]], [5, [5.0, 4.0]], [6, [5.6, 3.0729490168751585]], [7, [6.199999999999999, 2.2366442431225813]], [8, [6.799999999999999, 1.572949016875158]], [9, [7.399999999999999, 1.1468304511145395]], [10, [8, 1]]])
    end
    it "returns an array of each frame and it's coordinates when the starting coordinates are [0,0] and the end coordinates are [0,-10]" do
      expect(@test_object_007.get_all_frame_coordinates).to eq([[0, [0, 0]], [1, [0, -0.24471741852423268]], [2, [0, -0.9549150281252627]], [3, [0, -2.061073738537634]], [4, [0, -3.4549150281252627]], [5, [0, -5.0]], [6, [0, -6.545084971874737]], [7, [0, -7.938926261462366]], [8, [0, -9.045084971874736]], [9, [0, -9.755282581475768]], [10, [0, -10]]])
    end
    it "returns an array of each frame and it's coordinates when the starting coordinates are [0,0] and the end coordinates are [0,10]" do
      expect(@test_object_008.get_all_frame_coordinates).to eq([[0, [0, 0]], [1, [0, 0.24471741852423268]], [2, [0, 0.9549150281252627]], [3, [0, 2.061073738537634]], [4, [0, 3.4549150281252627]], [5, [0, 5.0]], [6, [0, 6.545084971874737]], [7, [0, 7.938926261462366]], [8, [0, 9.045084971874736]], [9, [0, 9.755282581475768]], [10, [0, 10]]])
    end
    it "returns an array of each frame and it's coordinates when the starting coordinates are [0,0] and the end coordinates are [0,0]" do
      expect(@test_object_009.get_all_frame_coordinates).to eq([[0, [0, 0]], [1, [0, 0]], [2, [0, 0]], [3, [0, 0]], [4, [0, 0]], [5, [0, 0]], [6, [0, 0]], [7, [0, 0]], [8, [0, 0]], [9, [0, 0]], [10, [0, 0]]])
    end
    it "returns an array of each frame and it's coordinates when the starting coordinates are [-3,3] and the end coordinates are [3,3]" do
      expect(@test_object_010.get_all_frame_coordinates).to eq([[0, [-3, 3]], [1, [-2.4, 3]], [2, [-1.7999999999999998, 3]], [3, [-1.1999999999999997, 3]], [4, [-0.5999999999999998, 3]], [5, [2.220446049250313e-16, 3]], [6, [0.6000000000000002, 3]], [7, [1.2000000000000002, 3]], [8, [1.8000000000000003, 3]], [9, [2.4000000000000004, 3]], [10, [3, 3]]])
    end
    it "returns an array of each frame and it's coordinates when the starting coordinates are [3,3] and the end coordinates are [-3,3]" do
      expect(@test_object_011.get_all_frame_coordinates).to eq([[0, [0, 3]], [1, [-1.0, 3]], [2, [-2.0, 3]], [3, [-3.0, 3]], [4, [-4.0, 3]], [5, [-5.0, 3]], [6, [-6.0, 3]], [7, [-7.0, 3]], [8, [-8.0, 3]], [9, [-9.0, 3]], [10, [-10, 3]]])
    end
    it "returns an array of each frame and it's coordinates when the starting coordinates are [-3,-3] and the end coordinates are [3,1]" do
      expect(@test_object_012.get_all_frame_coordinates).to eq([[0, [-3, -3]], [1, [-1.8, -2.618033988749895]], [2, [-0.6000000000000001, -1.618033988749895]], [3, [0.5999999999999999, -0.38196601125010543]], [4, [1.7999999999999998, 0.6180339887498947]], [5, [3, 1]]])
    end
    it "returns an array of each frame and it's coordinates when the starting coordinates are [3,2] and the end coordinates are [3,3]" do
      expect(@test_object_017.get_all_frame_coordinates).to eq([[0, [3, 2]], [1, [3, 2.024471741852423]], [2, [3, 2.0954915028125263]], [3, [3, 2.2061073738537633]], [4, [3, 2.3454915028125263]], [5, [3, 2.5]], [6, [3, 2.6545084971874737]], [7, [3, 2.7938926261462367]], [8, [3, 2.9045084971874737]], [9, [3, 2.975528258147577]], [10, [3, 3]]])
    end
    it "returns an array of each frame and it's coordinates when the starting coordinates are [3,3] and the end coordinates are [3,2]" do
      expect(@test_object_018.get_all_frame_coordinates).to eq([[0, [3, 3]], [1, [3, 2.975528258147577]], [2, [3, 2.9045084971874737]], [3, [3, 2.7938926261462367]], [4, [3, 2.6545084971874737]], [5, [3, 2.5]], [6, [3, 2.3454915028125263]], [7, [3, 2.2061073738537633]], [8, [3, 2.0954915028125263]], [9, [3, 2.024471741852423]], [10, [3, 2]]])
    end
  end
end
