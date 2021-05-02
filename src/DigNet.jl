module DigNet

export Var, Func

struct Var
    data
end

function Func(f)
    forward = input -> Var(f(input.data))
    return forward
end

end # module
