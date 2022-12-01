
function find_top_n_chunks(filename, n)
    f = open(filename, "r")
    global calories = 0             
   
    global arr = Int64[]

    for line in readlines(f)
    
        if length(line) == 0
            #println("chunk done")
            push!(arr, calories)
            
            #most_calories = max(calories, most_calories)
            calories = 0
        else 
            calories += parse(Int64, line)
        end
 
    
    end
    push!(arr, calories)
    close(f)

    sort!(arr, rev=true)

    return sum(arr[1:n])
end

solution = find_top_n_chunks("input.txt", 3)

println(solution)


function test_solution()
    return find_top_n_chunks("test_input.txt", 3)
end

println("test solution result:")
println(test_solution())