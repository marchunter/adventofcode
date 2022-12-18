
function get_priority_score(filename, n)
    f = open(filename, "r")
    global score = 0
    global priostr = join(collect('a':'z')) * join(collect('A':'Z'))
    global l1, l2, l3
   
    for (idx, line) in enumerate(readlines(f))
        l = length(line)
        #println(idx)
        #println(idx % 3)
        if (idx % 3) == 1
        l1 = line
        elseif idx % 3 == 2
        l2 = line
        else
        l3 = line
        i = intersect(l1, l2, l3)
        #println(l1, l2, l3)
        #println(i)
        score += findfirst(i[1], priostr)
        end

    end
    close(f)
    return score
end

solution = get_priority_score("input.txt", 3)

println(solution)


function test_solution()
    return get_priority_score("test_input.txt", 3)
end

println("test solution result:")
println(test_solution())