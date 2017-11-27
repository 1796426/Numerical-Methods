# WORKSHEET 2 FUNCTIONS

function traverse(M::Nullable{LList})
    if isnull(M) == true
        println(get(M).data.key)
        println("")
        println(get(M).data.value)
    else
        println(get(M).data.key," ",get(M).data.value)
        traverse(get(M).next)
    end
end

# Given a Linked List, M, the function above traverses the list and prints out the key-value pairs stored in it.

function search(M::Nullable{LList},k::Int64) 
    if isnull(M) == true
        return Nullable{KVPair}()
    elseif (get(M).data).key == k
        return get(M).data
    else 
        search(get(M).next,k)
    end
end

# Given a Linked List, M, and a specific key, k, the function above conducts a Linear Search of the list and prints out the corresponding KVPair.

function intervalmembership(S::Nullable{LList},V::Float64) 
    if isnull(S) == true
        return Nullable{KVPair}()
    else 
        if (get(S).data).value > V
            return get(S).data
        elseif (get(S).data).value < V
            intervalmembership(get(S).next,V)
       end
    end
end

# Outputs a KVPair from a Linked List S, which corresponds to the interval in which V lies. In particular, it returns the KVPair with a value that is closest to but higher than V. If V cannot be found, an empty KVPair is returned.

function intervalmembership2(FT::Nullable{FTree}, x::Float64)
        if isnull(get(FT).left) & isnull(get(FT).right)
            return get(FT).data
        elseif x > get(FT).data.value
            return
        else 
            if x <= get(get(FT).left).data.value
                intervalmembership2(get(FT).left,x)
            else
                intervalmembership2(get(FT).right,x - get(get(FT).left).data.value)
            end
        end
end

# Outputs a KVPair from a Fenwick Tree FT, which corresponds to the interval in which x lies. If x cannot be found, no output is returned.

function normalnew(x, D, t)
    return (1.0/sqrt(2.0*D*t))*exp(-abs(x)*sqrt(2/(D*t)))
end

#
