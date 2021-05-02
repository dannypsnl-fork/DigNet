module DigNet

export Var, Func

struct Var
    data
end

function Func(f)
    input -> Var(f(input.data))
end

end # module
