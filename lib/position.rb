class Position
  def initialize(x, y)
    @x = x
    @y = y
  end

  def <(p)
    p.x > @x || p.y > @y
  end

  def >(p)
    p.x < @x || p.y < @y
  end

  attr_reader :x, :y
end


# class TTime
#   def initialize(hour, minute)
#     @hour = hour
#     @minutes = minute
#   end


#   def +(delta)
#     tminutes = @minutes + delta
#     @hour = @hour + tminutes / 60
#     @minutes = tminutes % 60
#     self
#   end

#   def to_s
#     "The average is %02d:%02d" % [hour, minutes]
#   end

#   attr_reader :hour, :minutes
# end
