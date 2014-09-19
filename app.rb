class PositionByFrameGen

  def initialize(startingCoordinate, endingCoordinate, startingFrame, endingFrame)
    @TWO = 2
    @startingCoordinate = startingCoordinate
    @endingCoordinate = endingCoordinate
    @startingFrame = startingFrame
    @endingFrame = endingFrame
    @horizontalCoordinateDifference = (@startingCoordinate[0]).abs + (@endingCoordinate[0]).abs
    @horizontalHalf = @horizontalCoordinateDifference / @TWO
    @verticalCoordinateDifference = (@startingCoordinate[1]).abs + (@endingCoordinate[1]).abs
    @verticalHalf = @verticalCoordinateDifference / @TWO
    @midpoint = calculateMidpoint()
    @totalNumberOfFrames = @endingFrame - @startingFrame
    @direction = determineDirection()
  end

  def determineDirection
    if @endingCoordinate[0] > @startingCoordinate[0] && @endingCoordinate[1] > @startingCoordinate[1]
      "forwardAndUp"
    elsif @endingCoordinate[0] > @startingCoordinate[0]
      "forwardAndDown"
    elsif @endingCoordinate[1] > @startingCoordinate[1]
      "backAndUp"
    else
      "backAndDown"
    end
  end

  def calculateMidpoint()
    xMidpoint = 0
    yMidpoint = 0
    if @startingCoordinate[0] > @endingCoordinate[0]
      xMidpoint = @startingCoordinate[0] - @horizontalHalf
    else
      xMidpoint = @endingCoordinate[0] - @horizontalHalf
    end
    if @startingCoordinate[1] > @endingCoordinate[1]
      yMidpoint = @startingCoordinate[1] - @verticalHalf
    else
      yMidpoint = @endingCoordinate[0] - @verticalHalf
    end
    [xMidpoint, yMidpoint]
  end

  def calculateY(x)
    #Amplitude * Math.sin((2 * Math::PI / Frequency) * ( x - horizontalOffset)) + verticalOffset
    @verticalHalf * Math.sin((Math::PI / @horizontalCoordinateDifference) * (x - @midpoint[0])) + @midpoint[1]
  end

  def getAllFrameCoordinates()
    arr = []
    xIncrement = (@endingCoordinate[0] - @startingCoordinate[0].abs).to_f/@totalNumberOfFrames
    currentXCoordinate = @startingCoordinate[0]
    arr.push([@startingFrame, @startingCoordinate])
    case @direction
    when "forwardAndUp"
      arr = forwardAndUp(arr, xIncrement)
    when "forwardAndDown"
      arr = (forwardAndDown(arr, xIncrement))
    when "backAndUp"
      arr.push(backAndUp(xIncrement, currentXCoordinate))
    else
      arr.push(backAndDown(xIncrement, currentXCoordinate))
    end
    arr.push([@endingFrame, @endingCoordinate])
  end

  def forwardAndUp(arr, xIncrement)
    currentXCoordinate = @startingCoordinate[0] + xIncrement
    ((@startingFrame + 1)..(@endingFrame - 1)).each do |frame|
      arr.push([frame,[currentXCoordinate, calculateY(currentXCoordinate)]])
      currentXCoordinate += xIncrement;
    end
    arr
  end

  def forwardAndDown(arr, xIncrement)
    currentXCoordinate = @startingCoordinate[0] + xIncrement
    ((@startingFrame + 1)..(@endingFrame - 1)).each do |frame|
      arr.push([frame,[currentXCoordinate, @endingCoordinate[1] - calculateY(currentXCoordinate)]])
      currentXCoordinate += xIncrement;
    end
    arr
  end

  def backAndUp
  end

  def backAndDown
  end

end
