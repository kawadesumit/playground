export addV2, addV3, addSubtractMultiplyDivide

function addV2(x, y)
    x + y
end

addV3(x, y) = x + y
map(x -> addV3(x, x), 1:100)
map(1:100) do x
    println("$x+$x = $(addV3(x, x))")
end # do)


# function having optional argument.
# it is also returning multiple values as a tuple
function addSubtractMultiplyDivide(x, y=5)
    x+y, x-y, x*y, round(x/y, digits=2)
end
@time @assert addSubtractMultiplyDivide(10, 6) == (16, 4, 60, 1.67)
@time @assert addSubtractMultiplyDivide(10) == (15, 5, 50, 2)

# function having keyword argument and default values
function addSubtractMultiplyDivideV2(; x=0, y=0)
    x+y, x-y, x*y, round(x/y, digits=2)
end
@time @assert addSubtractMultiplyDivideV2(x=10, y=6) == (16, 4, 60, 1.67)
@time @assert addSubtractMultiplyDivideV2(y=10) == (10, -10, 0, 0)


#=
Tuples:
    - constructed with comma, parenthesis.
    - immutable
    - fixed length
    - any data-type

    e.g. (1, 2)
        (a=1, b=2, c="hello")
=#

a = (10, 20, 30, 40.01, "hello")

a[2]
a[4]
a[5]

b = (x=1, y=1.1, z="welcome")
b[1]
b.x

b[2]
b.y

@assert b[3] == b.z

# function composition
addSubtractMultiplyDivideV2(a) = addSubtractMultiplyDivideV2(y=a)

(addSubtractMultiplyDivideV2 ∘ addV3)(1, 2)
@assert (addSubtractMultiplyDivideV2 ∘ addV3)(1, 2) == addSubtractMultiplyDivideV2(addV3(1, 2))

# function piping
1:11100 |> sum |> print
["my", "name", "is", "sumit"] .|> [uppercase, lowercase, reverse, length]
["my", "name", "is", "sumit"] |> join |> print
