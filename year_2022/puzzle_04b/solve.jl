
function get_overlap_score(filename)
    f = open(filename, "r")
    global score = 0
   
    for (idx, line) in enumerate(readlines(f))
        println(line)
        e1, e2 = split(line, ",")

        e1min, e1max = split(e1, "-")
        e2min, e2max = split(e2, "-")

        e1min = parse(Int, e1min)
        e2min = parse(Int, e2min)
        e1max = parse(Int, e1max)
        e2max = parse(Int, e2max)

        if (e1max >= e2min) && (e1min <= e2min)
            score +=1
        elseif (e2max >= e1min) && (e2min <= e1min)
            score +=1
        end
    end
    close(f)
    return score
end

solution = get_overlap_score("input.txt")

println(solution)


function test_solution()
    return get_overlap_score("test_input.txt")
end

println("test solution result:")
println(test_solution())