z = begin
    a = 1
    b = 2
    a + b
end

y = (a=1; b=2; a+b)

function evenOrOdd(x)
    result = nothing
    if !isinteger(x)
        result = "decimal"
    elseif iseven(x)
        result = "even"
    else
        result = "odd"
    end

    println("$(typeof(x))::$x --> $result")
end

for var in 1:10
    evenOrOdd(var)
end

for i in [100, 101, 201, 202, 201.1, 201.01]
    evenOrOdd(i)
end

for i in (100, 101, 201, 202, 201.2, 201.02)
    evenOrOdd(i)
end

struct RuntimeError3 <: Exception
    msg:: String
end

i = 10
while i > 0
    print("$i..")
    i -= 1

    if i == 1
        i = 10
        throw(RuntimeError3("just for fun !!"))
    end

end
