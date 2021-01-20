using Sockets

message = """welcome ! from aania, abhilasha & sumit"""
@async begin
    server = listen(2000)
    while true
        socket = accept(server)
        println(message)
    end
end

connect(2000)

@async begin
    server = listen(2001)
    while true
        socket = accept(server)
        @async while isopen(socket)
            write(socket, readline(socket, keep=true))
        end
    end
end

clientConn = connect(2001)

@async while isopen(clientConn)
    write(stdout, readline(clientConn, keep=true))
end

println(clientConn, "Hello universe!")
println(clientConn, "how are you aania?")

close(clientConn)

f = connect("google.com", 80)
for variable in 1:100:1_000
    local x = getaddrinfo("google.com")
    println(x)
end
