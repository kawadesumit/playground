struct ObjRandom end
struct ObjRandom2 end

"doSomething function"
doSomething() = throw(error("no implementation"))

"doSomething function: catch all"
doSomething(x, y) = println("What to do with $(x) and $(y)")

"doSomething function for numbers"
doSomething(x::Number, y::Number) = println("x + y = $(x + y)")

"doSomething function for string"
doSomething(x::String, y::String) = println(string(x, y))

"doSomething function - parametric"
doSomething(x::T, y::T) where {T} = println("generic aka parametric implementation")

"doSomething function for objects of type objRandom2"
doSomething(x::T, y::T) where {T <: ObjRandom2} = println("ObjRandom2: generic aka parametric implementation")

methods(doSomething)

try; doSomething(); catch e; println("error: ", e.msg); end
doSomething("hello", 123)
doSomething(1, 2.0)
doSomething("hello", "world")
doSomething(1.0, 2.0)
doSomething(ObjRandom(), ObjRandom())
doSomething(ObjRandom2(), ObjRandom2())

function tryEval()
    @eval newMethod() = println("hello")
    newMethod()
end

tryEval()

newMethod()

function sayHello(x::Int, ::ObjRandom)
    println("invoked sayHello")
end

sayHello(1, ObjRandom())
