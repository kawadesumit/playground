abstract type AbstractPaymentMethod end

struct PaymentMethod{T <:Bool} <: AbstractPaymentMethod
    name::String
    process::T
end

cc = PaymentMethod{Bool}("creditcard", true)
svc = PaymentMethod{Bool}("storedvaluecard", true)

function sleepV2(x::Int=5)
    println("sleep for $(x) seconds")
    # sleep(x)

    Timer(5)
    println("woke up !!")
end

@time sleepV2(0)

t1 = Timer(5)
