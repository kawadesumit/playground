struct Squares
    count::Int
end

Base.iterate(S::Squares, state=1) = state > S.count ? nothing : (state*state, state+1)
Base.eltype(::Type{Squares}) = Int
Base.length(S::Squares) = S.count
Base.sum(S::Squares) = (n = S.count; return n*(n+1)*(2n+1)/6)
Base.iterate(rS::Iterators.Reverse{Squares}, state = rS.itr.count) = state < 1 ? nothing : (state*state, state-1)

for i in Squares(10)
    println(i)
end

a1 = length(Squares(50))
a2 = collect(Squares(50))
@time sum(Squares(10000))

for i in Iterators.reverse(Squares(5))
    println(i)
end


struct TwoTimesSquares
    count::Int
end

Base.iterate(S::TwoTimesSquares, state=1) = state > S.count ? nothing : (4*state*state, state+1)
Base.eltype(::Type{TwoTimesSquares}) = Int
Base.length(S::TwoTimesSquares) = S.count
Base.sum(S::TwoTimesSquares) = (n = S.count*2; return n*(n+1)*(2n+1)/6)
Base.iterate(rS::Iterators.Reverse{TwoTimesSquares}, state = rS.itr.count) = state < 1 ? nothing : (4*state*state, state-1)

for i in TwoTimesSquares(5)
    println(i)
end

function Base.getindex(S::Squares, i::Int)
    1 <= i <= S.count || throw(BoundsError(S, i))
    i*i
end

function Base.getindex(S::TwoTimesSquares, i::Int)
    1 <= i <= S.count || throw(BoundsError(S, i))
    for a in 1:i
//TODO start here
    end
end

println(getindex(Squares(5), 3))
println(getindex(TwoTimesSquares(5), 3))
