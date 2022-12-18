

function get_visible_trees(filename)
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
    #m = hcat(tmp)
    #m = Matrix(m)
    #println(typeof(m))
    println(m)

    n_visible = 0
    for j = 1:size(m,2)
        for i = 1:size(m,1)
            val = m[i,j]
            left = maximum(m[i, 1:(j-1)], -1)
            right = max(m[i, (j+1):end])
            top = max(m[1:(i-1), j])
            bottom = max(m[(i+1):end, j])

            println([left, right, top, bottom])
            if (val > min([left, right, top, bottom]))
                n_visible += 1
            end
        end
    end

    return n_visible
end

solution = get_visible_trees("input.txt")
println(solution)


function test_solution()
    return get_visible_trees("test_input.txt")
end

println("test solution result:")
println(test_solution())