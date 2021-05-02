#=
runtests:
- Julia version: 
- Author: dannypsnl
- Date: 2021-05-02
=#

using DigNet
using Test: @testset, @test

@testset "Forward Function" begin
    mul2 = Func(x -> x * 2)
    x = Var([1, 2, 3])
    @test mul2(x).data == [2, 4, 6]
end
