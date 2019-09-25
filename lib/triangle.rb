class Triangle
  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def valid_triangle?
    [side1, side2, side3].none? { |side| side <= 0 } &&
      side1 + side2 > side3 && side2 + side3 > side1 && side1 + side3 > side2
  end

  def kind
    raise TriangleError unless valid_triangle?

    if [side1, side2, side3].uniq.length.eql?(1)
      :equilateral
    elsif [side1, side2, side3].uniq.length.eql?(2)
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
  end
end
