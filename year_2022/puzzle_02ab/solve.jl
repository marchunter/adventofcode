
function get_total_score(filename, n)
    f = open(filename, "r")
    global score = 0
    # A Rock - 1
    # B Paper - 2
    # C Scissors -3

    # X lose - 0
    # Y draw - 3
    # Z win - 6

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
        score += s[line] + w[line[3]]
    end
    close(f)
    return score
end

solution = get_total_score("input.txt", 3)

println(solution)


function test_solution()
    return get_total_score("test_input.txt", 3)
end

println("test solution result:")
println(test_solution())