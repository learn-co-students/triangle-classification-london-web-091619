require 'pry'
class Triangle
  # write code here
  attr_reader :length1, :length2, :length3
  def initialize(length1, length2, length3)
    @length1 = length1
    @length2 = length2
    @length3 =length3

  end

  def kind
    no_sides_or_negative
    triangle_inequality
    if (@length1 == @length2 && @length3 < @length2 )|| (@length2 == @length3 && @length1 < @length2) || (@length3 == @length1 && @length2 < @length3)
      :isosceles
    elsif @length1 == @length2 && @length2 == @length3
      :equilateral
    else
      :scalene
    end
  end
  
  def no_sides_or_negative
    triangle = @length1*@length2*@length3
        raise TriangleError if triangle <= 0
  end

  def triangle_inequality
   raise TriangleError if @length1 + @length2 <= @length3 || @length2 + @length3 <= @length1 || @length3 + @length1 <= @length2
  end

  class TriangleError < StandardError
  end

end
