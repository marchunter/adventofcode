
function _add(t1, t2)
    return (t1[1]+t2[1], t1[2]+t2[2])
end 

function move_tail(head, tail, direction)

    if (abs(head[1] - tail[1]) > 1) || (abs(head[2] - tail[2]) > 1)
        if (head[1] == tail[1]) || (head[2] == tail[2])
            tail = _add(tail, direction)
            println("follow head ", tail)
        else
            tail = _add(tail, direction)
            other_direction = findfirst(x -> x==0, direction)
            
            head[other_direction] > tail[other_direction]

            
            t1 = tail[1]
            t2 = tail[2]
            if other_direction == 1
                t1 = head[1]
            elseif other_direction == 2
                t2 = head[2]
            else
                println("WARNING")
            end
            tail = (t1, t2)
            println("diagonal ", tail)
        end
    end
    println(tail)
    return tail
end

function count_tail_positions(filename)
    f = open(filename, "r")
    global head = (0,0)
    global tail = (0,0)
    global positions = Set([tail])

    global dirdict = Dict(
       "R" => (1, 0),
       "L" => (-1, 0),
       "U" => (0, 1),
       "D" => (0, -1),
    )

    
    for (linenumber, line) in enumerate(readlines(f))
        println(linenumber)
        direction, n_steps = split(line, " ")
        n_steps = parse(Int, n_steps)
        direction = dirdict[direction]

        for i  in 1:n_steps
            head = _add(head, direction)
            tail = move_tail(head, tail, direction)
            push!(positions, tail)
        end
    end
    close(f)

    println(positions)
    return length(positions)
end

solution = count_tail_positions("input.txt")
println(solution)


function test_solution()
    return count_tail_positions("test_input.txt")
end

println("test solution result:")
println(test_solution())