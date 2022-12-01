
function find_most_calories_total(filename)
    f = open(filename, "r")
    global calories = 0             
    global most_calories = 0             
    
    for line in readlines(f)
    
        if length(line) == 0
            #println("chunk done")
            most_calories = max(calories, most_calories)
            calories = 0
        else 
            calories += parse(Int64, line)
        end
 
    
    end
    
    close(f)
    return max(calories, most_calories)
end


solution = find_most_calories_total("input.txt")

println(solution)


function test_solution()
    return find_most_calories_total("test_input.txt")
end

println("test solution result:")
println(test_solution())