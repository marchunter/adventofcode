
function get_overlap_score(filename, n)
    f = open(filename, "r")
    global score = 0
   
    for (idx, line) in enumerate(readlines(f))
        e1, e2 = split(line, ",")

        e1min, e1max = split(e1, "-")
        e2min, e2max = split(e2, "-")

        #i = intersect(l1, l2, l3)
        score += 1
        end

    end
    close(f)
    return score
end

solution = get_overlap_score("input.txt", 3)

println(solution)


function test_solution()
    return get_overlap_score("test_input.txt", 3)
end

println("test solution result:")
println(test_solution())