module playground

@info "welcome to my playground!"

export greet, add

greet(x, y) = println("Hello World! $x+$y=$(x+y)")

add(x, y) = x + y

end # module
