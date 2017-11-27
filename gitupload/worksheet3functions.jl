# WORKSHEET 3 FUNCTIONS

# Constructs a finite difference differential of f(x) = sin(exp(x)) eveluated at x=x1 with step size h.

function df(x1,h)
    f1 = sin(exp(x1))
    f2 = sin(exp(x1 + h))
    f3 = sin(exp(x1 + 2*h))
    s = -3*f1 + 4*f2 - f3
    d = s/(2h)
    return d
end

# Evaluates f(x) at x = s.

function f(s)
    return sin(exp(s))
end

# Evaluates f'(x) at x = s.

function fprime(s)
    return cos(exp(s))*exp(s)
end


