using playground, Test

@testset "function testcases" begin
    @test addV2(7, 7) == 14
    @test addV3(7, 7) == 14
    @test addSubtractMultiplyDivide(10, 3) == (13, 7, 30, 3.33)
    @test addSubtractMultiplyDivide(10, 6) == (16, 4, 60, 1.67)
end
