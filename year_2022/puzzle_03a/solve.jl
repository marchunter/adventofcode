
function get_priority_score(filename, n)
    f = open(filename, "r")
    global score = 0
    global priostr = join(collect('a':'z')) * join(collect('A':'Z'))
    global s = Dict(
        "A X" => 3, # C
        "A Y" => 1, # A
        "A Z" => 2, # B
        "B X" => 1, # A
        "B Y" => 2, # B
        "B Z" => 3, # C
        "C X" => 2, # B
        "C Y" => 3, # C
        "C Z" => 1, # A
    )

    global w = Dict(
        'X' => 0,
        'Y' => 3,
        'Z' => 6,
    )
   
    for line in readlines(f)
        #score += s[line] + w[line[3]]
        l = length(line)

        c1 = first(line, convert(Int, l/2)) #line[1:l/2]
        c2 = last(line, convert(Int,l/2)) # line[(l/2)+1:end]

        i = intersect(c1, c2)
        score += findfirst(i[1], priostr)


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