using ForwardDiff
using Test: @testset, @test

function squareroot(x) #pretending we don't know sqrt()
    z = copy(x) # Initial starting point for Newton’s method
    while abs(z*z - x) > 1e-13
        z = z - (z*z-x)/(2z)
    end
    return z
end

@testset "Diff" begin
    @test squareroot(2.0) == 1.4142135623730951
    dsqrt(x) = ForwardDiff.derivative(squareroot, x)
    dsqrt(2.0)
    @test dsqrt(2.0) == 0.35355339059327373
end
