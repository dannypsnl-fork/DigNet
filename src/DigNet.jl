module DigNet

export Var, Func

struct Var
    data
    grad
    Var(data) = new(data, nothing)
end

function Func(f)
    input -> Var(f(input.data))
end

end # module
