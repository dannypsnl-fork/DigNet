#=
runtests:
- Julia version: 
- Author: dannypsnl
- Date: 2021-05-02
=#

using DigNet
using Test: @testset, @test

mul2 = Func(x -> x * 2)
Exp = Func(x -> broadcast(exp, x))
square = Func(x -> broadcast(x -> x ^ 2, x))

@testset "Forward Function" begin
    x = Var([1, 2, 3])
    @test mul2(x).data == [2, 4, 6]
    @test Exp(x).data == [2.718281828459045, 7.38905609893065, 20.085536923187668]
    @test square(x).data == [1, 4, 9]
end

@testset "Diff" begin
    numberical_diff(f, x, eps = 1e-4) = begin
         x0 = Var(broadcast(x -> x - eps, x.data))
         x1 = Var(broadcast(x -> x + eps, x.data))
         y0 = f(x0)
         y1 = f(x1)
         return (y1.data - y0.data) / (2 * eps)
    end
    f(x) = square(Exp(square(x)))
    x = Var([0.5])
    @test numberical_diff(f, x) == [3.2974426293297388]
end
