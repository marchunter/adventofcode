
function _maximum(arr, default=-1)
    if length(arr) == 0
        return default
    else
        return maximum(arr)
    end
end

function _findfirst(condition, arr)

    res = findfirst(condition, arr)
    if isnothing(res)
        res = length(arr)
    end

    return res    
end

function get_scenic_view(filename)
    f = open(filename, "r")
    global tmp = []
    global  m = Array{Int16}(undef, 0, 2)

    
    for (linenumber, line) in enumerate(readlines(f))
        println(linenumber)
        arr = split(line, "")
        arr = parse.([Int], arr)
        push!(tmp, arr)
    end
    close(f)
    m = reduce(hcat, tmp)

    n_max = 0
    for j = 1:size(m,2)
        for i = 1:size(m,1)
            val = m[i,j]
            left = _findfirst(x -> x>=val, reverse(m[i, 1:(j-1)]))
            right = _findfirst(x -> x>=val, m[i, (j+1):end])
            top = _findfirst(x -> x>=val, reverse(m[1:(i-1), j]))
            bottom = _findfirst(x -> x>=val, m[(i+1):end, j])

            #println([left, right, top, bottom])
            n_visible = 1
            for v in [left, right, top, bottom]
                n_visible *= v
            end
            if n_visible > n_max
                n_max = n_visible
            end  
        end
    end

    return n_max
end

solution = get_scenic_view("input.txt")
println(solution)


function test_solution()
    return get_scenic_view("test_input.txt")
end

println("test solution result:")
println(test_solution())