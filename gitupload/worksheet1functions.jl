# WORKSHEET 1 FUNCTIONS

# The following function solves the recurrence relation given in question 1.1 using Float32 arithmetic, returning the first v elements of the recursion in the form of a vector.

function recursion32(v)
    x = zeros(Float32,v)
    x[1] = 1
    x[2] = 2/3
    t = Float32(2)
    u = Float32(8/9)
    for i = 2:v-1
        x[i+1] = Float32(t*x[i] - u*x[i-1])
    end
    return x
end

# The following function solves the recurrence relation given in question 1.1 using Float64 arithmetic, returning the first v elements of the recursion in the form of a vector.

function recursion64(v)
    x = zeros(Float64,v)
    x[1] = 1
    x[2] = 2/3
    for i = 2:v-1
        x[i+1] = 2*x[i] - (8/9)*x[i-1]
    end
    return x
end

# The following function solves the recurrence relation given in question 1.1 using Float128 arithmetic, returning the first v elements of the recursion in the form of a vector.

function recursion128(v)
	c1 = BigFloat(2)
	c2 = BigFloat(8)/BigFloat(9)
    x = zeros(BigFloat,v)
    x[1] = BigFloat(1)
    x[2] = BigFloat(2)/BigFloat(3)
    for i = 2:v-1
        x[i+1] = c1*x[i] - c2*x[i-1]
    end
    return x
end

# The function below takes two ordered integer-valued arrays (or lists), A and B, with perhaps different lengths and merges them together into one ordered list. This function is provided in the question.

function mergepresorted(A::Array{Int64,1}, B::Array{Int64,1})
    if length(A) == 0
        return B
    elseif length(B) == 0
        return A
    elseif A[1] < B[1]
        return vcat([A[1]], mergepresorted(A[2:end], B))
    else
        return vcat([B[1]], mergepresorted(A, B[2:end]))
    end    
end

# The function below carries out the mergesort algorithm on an integer-valued array, x.

function mergesort(x::Array{Int64,1})
     l = length(x)
        if l > 2
            left = x[1 : div(l, 2)]
            right = x[div(l, 2) + 1 : end]
            left_result = mergesort(left)
            right_result = mergesort(right)
        return mergepresorted(left_result, right_result)
    elseif l < 2
        return x
    else
        if x[1] > x[2]
            temp = x[1]
            x[1] = x[2]
            x[2] = temp
        end
        return x
    end
end
