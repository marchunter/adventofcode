
function get_marker_position(filename, n)
    f = open(filename, "r")
    global marker_position = 0
    global arr = []
    
    for line in readlines(f)
        for i in 1:length(line)
            # read characters
            start = i
            stop = i+(n-1)
            snippet = line[start:stop]
            if length(Set(snippet)) == n
                marker_position = stop
                break
            end
        end
    end
    close(f)

    return marker_position
end

solution = get_marker_position("input.txt", 14)
println(solution)


function test_solution()
    return get_marker_position("test_input.txt", 14)
end

println("test solution result:")
println(test_solution())