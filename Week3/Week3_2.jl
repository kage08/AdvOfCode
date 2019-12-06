function getcoords(arr::Array{Tuple{Char,Int64}})::Array{Tuple{Int64,Int64}}
    coords::Array{Tuple{Int64,Int64}} = Array([])
    x, y = 0, 0
    for (dir, steps) in arr
        for _ in 1:steps
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

function mindelay(arr1::Array{Tuple{Int64,Int64}}, arr2::Array{Tuple{Int64,Int64}})::Int64
    common_coords = Set(arr1) ∩ Set(arr2)
    delay = indexin(common_coords, arr1) + indexin(common_coords, arr2)
    return minimum(delay)
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
println(mindelay(c1, c2))
