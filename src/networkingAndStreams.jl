write(stdout, "hello sumit")
read(stdin, Char)

x = zeros(UInt, 4)
read!(stdin, x)

read(stdin, 5)

for line in eachline(stdin)
    print("you entered: $line")
end

while !eof(stdin)
    x = read(stdin, Char)
    print(x)
end

fileTemp = open("/home/sumit/codeDev/playground/temp.txt")

txt1 = readlines(fileTemp)

for line in readline(fileTemp)
    println(line)
end

close(fileTemp)

fileTemp2 = open("/home/sumit/codeDev/playground/temp.txt", "w")
write(fileTemp2, "hello abhilasha")
close(fileTemp2)

# open by passing a function
function readNCapitalize(f::IOStream)
    return uppercase(read(f, String))
end

t1 = open(readNCapitalize, "/home/sumit/codeDev/playground/temp.txt")

# open with anonymous function
open("/home/sumit/codeDev/playground/temp.txt") do f
    uppercase(read(f, String))
end
