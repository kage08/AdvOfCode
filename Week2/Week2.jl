function transform!(arr::Array{Int64,1}, noun::Int64=12, verb::Int64=2)
    start::Int16 = 1
    arr[2] = noun
    arr[3] = verb
    while arr[start] != 99
        if arr[start] == 1
            arr[arr[start+3]+1] = arr[arr[start+1]+1] + arr[arr[start+2]+1]
        elseif arr[start] == 2
            arr[arr[start+3]+1] = arr[arr[start+1]+1] * arr[arr[start+2]+1]
        end
        start += 4
    end
end

function getData(fname::String)::Array{Int64,1}
    f = open(fname)
    line = read(f, String)
    line = split(strip(line), ',')
    return map(x -> parse(Int64, x), line)
end

inp = getData("input")
transform!(inp)
println(inp[1])

inp = getData("input")
for n = 1:100
    for v = 1:100
        i = deepcopy(inp)
        transform!(i, n, v)
        if i[1]==19690720
            println(100 * n + v)
        end
    end
end