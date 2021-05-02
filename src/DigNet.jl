module DigNet

struct Variable
    data
end

function Function(f)
    forward = function(input)
        x = input.data
        y = f(x)
        return Variable(y)
    end
end

mul2 = Function(funciton(x) x*2 end)
mul2(Variable(3))

end # module
