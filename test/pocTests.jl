using playground, Test

@testset "POC Testset" begin
    @test 2 == 2
    @test 4 == add(1, 3)
    @test 4 == add(2, 2)
    @test 4 == add(3, 1)
    # @test 4 == add(1, 3)
end
