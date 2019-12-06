# Copyright (c) 2019 Harshavardhan P K
# 
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

function getcoords(arr::Array{Tuple{Char,Int64}})::Set{Tuple{Int64,Int64}}
    coords::Set{Tuple{Int64,Int64}} = Set([])
    x, y = 0, 0
    for (dir, steps) in arr
        for _ ∈ 1:steps
            if dir == 'R'
                x += 1
            elseif dir == 'L'
                x -= 1
            elseif dir == 'U'
                y += 1
            elseif dir == 'D'
                y -= 1
            end
            push!(coords, (x, y))
        end
    end
    return coords
end

function closestcoods(arr1::Set{Tuple{Int64,Int64}}, arr2::Set{Tuple{Int64,Int64}})::Int64
    return minimum([abs(x) + abs(y) for (x, y) in arr1 ∩ arr2])
end

function getData(fname::String)
    f = open(fname)
    line = readline(f)
    line = split(strip(line), ',')
    w1 = map(x -> (x[1], parse(Int64, x[2:end])), line)
    line = readline(f)
    line = split(strip(line), ',')
    w2 = map(x -> (x[1], parse(Int64, x[2:end])), line)
    return w1, w2
end

w1, w2 = getData("input")
c1, c2 = getcoords(w1), getcoords(w2)
println(closestcoods(c1, c2))
