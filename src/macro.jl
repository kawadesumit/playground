macro sayHello()
    return :(println("hello world !! from Sumit"))
end

macro sayHello(name)
    println("I run at parse time. name=", name)
    return :(println("Runtime: hello $($name) !! from Sumit"))
end

@sayHello
@sayHello("abhilasha")
@sayHello("aania")

ex = macroexpand(Main, :(@sayHello("aania")))
typeof(ex)
eval(ex)

ex2 = @macroexpand @sayHello "aania"
typeof(ex2)
eval(ex2)

#=
 @sayHello("abhilasha") => both parse time and runtime statements are run.
 @macroexpand => only parse time statement is run
 eval() => Parse time statement is not run. only runtime statement is run
=#

macro show_args(a)
    show(a)
end

@show_args(1+1+1)


dump(@__DIR__)
dump(@__FILE__)
dump(@__LINE__)
dump(@__MODULE__)

macro someArg(x)
    print("1 arg")
end

macro someArg(x::Int)
    print("integer arg")
end

@someArg 1  // integer arg is called

a=1
@someArg a  //non-integer arg is called.

# macro dispatch is based on the types of AST that are handed to the macro,
# not the types that the AST evaluates to at runtime
