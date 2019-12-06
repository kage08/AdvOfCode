function checkNum(x::Int64)::Bool
    x1 = x
    isadj = false
    prev = x%10
    x = x÷10
    while x > 0
        curr = x%10
        if prev==curr
            isadj = true
        end
        if prev < curr
            return false
        end
        prev = curr
        x = x÷10
    end
    return isadj
end

function checkNum2(x::Int64)::Bool
    x1 = x
    isadj = false
    isprevadj = false
    prev = x%10
    x = x÷10
    while x > 0
        curr = x%10
        if prev < curr
            return false
        end
        prev = curr
        x = x÷10
    end
    x = x1
    prevprev = x%10
    x = x÷10
    prev = x%10
    x = x÷10
    if prev == prevprev != x%10
        return true
    end
    curr = x%10
    x = x÷10
    while x>0
        if x%10 != prev == curr != prevprev
            return true
        end
        prevprev = prev
        prev = curr
        curr = x%10
        x = x÷10
    end

    if prev == curr != prevprev
        return true
    end

    return false
end

function findnum(l::Int64, r::Int64)::Int32
    count::Int32 = 0
    for x = l:r
        if checkNum(x)
            count+= 1
        end
    end
    return count
end

function findnum2(l::Int64, r::Int64)::Int32
    count::Int32 = 0
    for x = l:r
        if checkNum2(x)
            count+= 1
        end
    end
    return count
end

println(findnum(134792, 675810))
println(findnum2(134792, 675810))