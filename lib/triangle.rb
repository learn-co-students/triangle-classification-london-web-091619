class Triangle
  attr_accessor :length1, :length2, :length3

  def initialize(length1, length2, length3)
    @length1 = length1
    @length2 = length2
    @length3 = length3
  end

  def kind
    raise TriangleError unless valid?

    if self.length1 == self.length2 && self.length1 == self.length3
      :equilateral
    elsif self.length1 != self.length2 && self.length2 != self.length3 && self.length1 != self.length3
      :scalene
    else
      :isosceles
    end
  end

  def valid?
    triangle_inequality_check_satisfied? && valid_lengths?
  end

  def valid_lengths?
    if self.length1 <= 0 ||
       self.length2 <= 0 ||
       self.length3 <= 0
      return false
    end
    true
  end

  def triangle_inequality_check_satisfied?
    if self.length1 + self.length2 > self.length3 &&
       self.length2 + self.length3 > self.length1 &&
       self.length1 + self.length3 > self.length2
      return true
    end
    false
  end

  class TriangleError < StandardError
  end
end
