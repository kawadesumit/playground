abstract type Vehicle end

abstract type Car <: Vehicle end
abstract type Bicycle <: Vehicle end
abstract type Airplane <: Vehicle end
abstract type TwoWheeler <:Vehicle end

struct Corolla <: Car
    make::String
    year:: Int8
    price::Number
end

struct Accord <: Car
    make::String
    year:: Int8
    price::Number
end

c1 = Corolla("toyota", 21, 24000);
c2 = Corolla("toyota", 20, 16000);

a1 = Accord("honda", 21, 26000);
a2 = Accord("honda", 20, 18000);

println("c1=$c1\nc2=$c2\na1=$a1\na2=$a2")

f1= fieldnames(Corolla);
println("fieldName[corolla]=", f1)

println("make[c1]=$(c1.make)")

# c1.make = "tesla" //immutable struct cannot be changed

mutable struct ModelS <: Car
    make::String
    year:: Int8
    price::Number
    autonomous::Bool

    ModelS(make, year, price) = new(make, year, price, true)
end

t1 = ModelS("tesla", 21, 125000)
println(t1)
t1.price = 150000   #mutable struct can be modified
println(t1)

CorollaOrModelS = Union{Corolla, ModelS}

struct Car2{T}
    make::T
    model::String
    year::Int32
    price::Number
    auto::Bool
end

c21 = Car2{Corolla}(Corolla("toyota", 21, 100), "corolla", 2021, 21000, false)
c22 = Car2{Accord}(Accord("toyota", 21, 100), "corolla", 2021, 21000, false)

log(car::Car) = println("Inside Car function")
log(car::Car2{Corolla}) = println("Inside Car2.Corolla function")
log(car::Car2{Accord}) = println("Inside Car2.Accord function")

log(c1);
log(a1);
log(c21)
log(c22)

# log(x) = println("$x")
log(Car2{Corolla} <: Corolla)
log(Car2{Corolla} <: Car2{Accord})
log(Car2{Corolla} <: Car2)

@NamedTuple begin
    a::Int
    b::String
    c::String
end

c = @NamedTuple{a::Int, b::String}((1, "hello"))
d = NamedTuple{(:a, :b, :c)}((1, "hello", "world"))
e = NamedTuple{(:a, :b, :c, :d)}((1, "hello", "world", "again !!!"))

t1 = supertype(typeof(c1))
isa(t1, Type{Vehicle})
isa(t1, Type{<: Vehicle})

t2 = supertype(t1)
isa(t2, Type{Vehicle})

t3 = Type{Vehicle}

function printSubTypeGraph(x::Type, delimiter::String)
    local a = subtypes(x)
    for a1 in a
        println(string(a1))
        for temp in subtypes(a1)
            println(string(delimiter), temp)
            printSubTypeGraph(temp, string(delimiter, delimiter))
        end
    end
end

printSubTypeGraph(Vehicle, "\t- ")
