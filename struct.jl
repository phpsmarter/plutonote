import Base: +, -

struct Point
  x::Float64
  y::Float64
end

a::Point + b::Point = Point(a.x + b.x, a.y + b.y)
a::Point - b::Point = Point(a.x - b.x, a.y - b.y)
dist(p::Point) = sqrt(p.x^2 + p.y^2)

a=Point(2,7)


