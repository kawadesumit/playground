@enum Color red green blue

for color in instances(Color)
    println(color)
end

struct Item
    id::Int
    org::String
    name::String
    uom::String
    cost::AbstractFloat
    color::Color
end

structInfo(T) = [(fieldname(T, i), fieldtype(T, i), fieldoffset(T, i)) for i = 1:fieldcount(T)]

for var in structInfo(Item)
    println(var)
end

item01 = Item(1, "tmsus", "item 001", "each", 9.99, red)

typeof(item01)
structInfo(x) = structInfo(typeof(x))
# structInfo(item01)  #causing stack overflow

floatmax(Float64)
x = (1, 2, 3, 100, 200, 300)
x[4]
length(x)
for var in x
    println(var)
end
keys(x)
values(x)
collect(x)
collect(pairs(x))

y = (a=1, b=2, c=3, d=100, e=200, f=300)
y[4]
y.e
length(y)
for var in y
    println(var)
end
keys(y)
values(y)
collect(y)
collect(pairs(y))

z = Dict(:a => 1, :b => 2)
z[:a]
z[:b]
z[:c]

z2 = Dict("g1" => "hello", "g2" => "world")
println(z2)
println(keys(z2))
println(values(z2))
