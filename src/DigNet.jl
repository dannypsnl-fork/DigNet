module DigNet

export Variable, Function

using Test: @testset, @test

struct Variable
    data
end

function Function(f)
    forward = input -> Variable(f(input.data))
    return forward
end

@testset "Forward Function" begin
    mul2 = Function(x -> x * 2)
    x = Variable([1, 2, 3])
    @test mul2(x).data == [2, 4, 7]
end

end # module
