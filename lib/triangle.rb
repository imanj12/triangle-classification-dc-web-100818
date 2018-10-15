class Triangle
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    # check for sides equal to or less than zero
    is_true = false
    is_true ||= side1 <= 0
    is_true ||= side2 <= 0
    is_true ||= side3 <= 0
    if is_true == true
      # begin
        raise TriangleError
      # rescue TriangleError => error
        # puts error.zerosides
      # end
    end

    # check for triangle inequality
    sorted = [@side1,@side2,@side3].sort
    greatest_side = sorted.pop
    if greatest_side < sorted.inject(0) { |zero, side| zero + side } == false
      # begin
        raise TriangleError
      # rescue TriangleError => error
        # puts error.inequality
      # end
    end

    #assuming above two pass, run triangle type tests below

    #check for equilateral
    if [@side1,@side2,@side3].uniq.length == 1
      return :equilateral
    end

    #check for isosceles
    if [@side1,@side2,@side3].uniq.length == 2
      return :isosceles
    end

    #check for scalene
    if [@side1,@side2,@side3].uniq.length == 3
      return :scalene
    end

  end

  class TriangleError < StandardError
    def zerosides
      puts "Triangle sides cannot be equal to or less than 0!"
    end

    def inequality
      puts "Chosen side lengths violate triangle inequality!"
    end

  end

end
