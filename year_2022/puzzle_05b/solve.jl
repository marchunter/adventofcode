
function get_top_crates(filename, n)
    f = open(filename, "r")
    global is_procedure = false
    pat = r"\[[0-9a-zA-Z]\]"
    #global arr = ["" for i in 1:9]

    #global arr = fill(Char[], 9)
    global arr = [Char[] for i=1:9]
    
    listOfLists = Any[]



    #println(line)
    for line in readlines(f)
        if is_procedure
            pat_move_n = r"move (\d+)"
            #move_n = line[findfirst(pat_move_n, line).stop]
            move_n = match(pat_move_n, line).captures[1]
            pat_move_from = r"from [0-9]"
            move_from_idx = line[findfirst(pat_move_from, line).stop]
            pat_move_to = r"to [0-9]"
            move_to_idx = line[findfirst(pat_move_to, line).stop]

            move_n = parse(Int64, move_n)
            move_from_idx = parse(Int64, move_from_idx)
            move_to_idx = parse(Int64, move_to_idx)

            #println(move_n)
            #println(move_from_idx)
            #println(move_to_idx)
            n_elements_to_move = min(length(arr[move_from_idx]), move_n)

            tmp = arr[move_from_idx][max(1, (end-n_elements_to_move+1)):end]
            arr[move_from_idx] = arr[move_from_idx][1: end-n_elements_to_move]

            append!(arr[move_to_idx], tmp)

            # for i in 1:min(length(arr[move_from_idx]), move_n)
            #     val = pop!(arr[move_from_idx])
            #     #println("move this value")
            #     #println(val)
            #     push!(arr[move_to_idx], val)
                
            # end
            println(line)
            println("tmp to move", tmp)
            println("arr after moving ", arr)
        else
            if length(line) == 0
                println("starting configuration done")
                println(arr)
                is_procedure = true
                
            else
                #println(arr)
                res = findall(pat, line)
                #println(res)
                for i in res
                    s = i.start
                    idx = Int((s+3) / 4)
                    #println(line[s+1], idx)
                    
                    pushfirst!(arr[idx], line[s+1])
                    #println(arr[idx])
                    #arr[idx] = line[s+1] * arr[idx]
                end 
                #println(arr)
            end
        end
    
    end
    close(f)

    println(arr)
    res = ""
    for i in arr
        if length(i) > 0
            res = res * pop!(i)
        end
    end
    println(res)
    return res
end

solution = get_top_crates("input.txt", 3)
println(solution)


function test_solution()
    return get_top_crates("test_input.txt", 3)
end

println("test solution result:")
println(test_solution())