class PositionByFrameGen

  def initialize(startingCoordinate, endingCoordinate, startingFrame, endingFrame)
    @startingCoordinate = startingCoordinate
    @endingCoordinate = endingCoordinate
    @startingFrame = startingFrame
    @endingFrame = endingFrame
    @totalNumberOfFrames = @endingFrame - @startingFrame
    @TWO = 2
    @amplitude = getHeightDistanceBetweenStartAndEndingCoordinate() / @TWO
  end

  def getHeightDistanceBetweenStartAndEndingCoordinate()
    opp = (@endingCoordinate[1] - @startingCoordinate[1]).abs
  end

  def caculatePositionsByFrame
  end

  def calculateY(x)
    @amplitude*Math.sin(((Math::PI/@TWO)/@amplitude)*(x - @amplitude)) + @amplitude
  end

  def getAllFrameCoordinates()
    arr = []
    xIncrement = (@endingCoordinate[0] - @startingCoordinate[0]).abs / @totalNumberOfFrames
    currentXCoordinate = @startingCoordinate[0]
    arr.push([@startingFrame, @startingCoordinate])
    ((@startingFrame + 1)..(@endingFrame - 1)).each do |frame|
      currentXCoordinate += xIncrement
      newCoordinate = [currentXCoordinate, calculateY(currentXCoordinate)]
      arr.push([frame, newCoordinate])
    end
    arr.push([@endingFrame, @endingCoordinate])
  end

end
