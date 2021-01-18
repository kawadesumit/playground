prog = "x+y"

expr1 = Meta.parse(prog)
expr1.args
dump(expr1)

expr2 = :(a + b + c + d)
typeof(expr2)
dump(expr2)

expr3 = quote
    x = 1
    y = 2
    z = 3
end
Meta.@dump expr3
dump(expr3)

a=1; b=2; c=3; d=4;
a1 = eval(expr2)
a2 = eval(expr3)
a3 = eval(expr1)

expr4 = Expr(:call, :+, 1, 2)
eval(expr4)

expr5 = :(1+2)
eval(expr5)

expr6 = Expr(:call, :+, a, b)
eval(expr6)
a=4;b=6


function math_expr1(op, op1...)
    op(op1...)
end
math_expr1(+, 1, 2, 3, 4, 5)

function math_expr2(op, op1, op2)
    op1f, op2f = map(x -> x isa(Number) ? 10*x : x, (op1, op2))
    return Expr(:call, op, op1f, op2f)
end
a3 = math_expr2(:+, 1, 3)
eval(a3)

a4 = math_expr2(:+, 1, Expr(:call, :*, 3, 2))
eval(a4)
