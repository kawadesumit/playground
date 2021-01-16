using playground: PlayModule01
using Test

# import playground.PlayModule01

@testset "modules testcases" begin
    @test PlayModule01.playSum(1, 2) === 3
    @test PlayModule01.playSum(2, 3) > 4
    @test PlayModule01.playSubtract(1, 2) === -1
end
