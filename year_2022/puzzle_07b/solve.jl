
function _climb_dir_tree(dir_tree, path)
    current_directory = dir_tree
    for d in path
        current_directory = current_directory[d]
    end
    return current_directory
end

function _get_flattened_dirs_file_size(dir_tree; flattened_dir=Dict(), parent_key="root")
    size = 0
    for (k,v) in dir_tree
        #println("key: $k, value: $v ", parent_key)
        flattened_key = parent_key * k

        if typeof(v) == Int
            size+= v #parse(Int, v)
        else
            _size, flattened_dir = _get_flattened_dirs_file_size(v, flattened_dir=flattened_dir, parent_key=flattened_key)
            size += _size
            flattened_dir[flattened_key] = _size
        end
        
    end 
    #println("return ", size)
    return size, flattened_dir
end

function get_total_size(flattened_dir)
    total_size = 0
    for (k,v) in flattened_dir
        total_size += v
    end
    return total_size
end

function get_min_size_over(flattened_dir, min_size_delete)
    current_size = 0
    for (k,v) in flattened_dir
        if current_size < min_size_delete
            current_size = v 
        end
        if (v >= min_size_delete) && (v < current_size)
            current_size = v
        end
    end
    return current_size
end


function get_total_size_of_delete(filename, max_size=40000000)
    f = open(filename, "r")
    global current_directory = "root"
    global path = []
    global directory_level = 0
    global dir_tree = Dict()
    global arr = []
    
    for (linenumber, line) in enumerate(readlines(f))
        println(linenumber)
        if line[1] == '$'
            println("command ", line)
            split_line = split(line)
            command = split_line[2]

            if command == "cd"
                dir = split_line[end]
                if dir == "/"
                    directory_level = 0
                    dir_tree["root"] = Dict()
                    current_directory = dir_tree["root"]
                    push!(path, "root")
                elseif dir == ".."
                    directory_level -= 1
                    pop!(path)
                    
                    current_directory = _climb_dir_tree(dir_tree, path)
                    path[end]
                else
                    directory_level += 1
                    push!(path, dir)

                    current_directory = current_directory[dir]
                end
            elseif command == "ls"
                println("ls")
            else
                println("not found")
            end
            
        else
            println("info")
            split_line = split(line)
            println(line)
            println(dir_tree)
            if split_line[1] == "dir"
                println("it's a dir")
                
                current_directory[split_line[2]] = Dict()
            else
                file_size = split_line[1]
                filename = split_line[2]
                current_directory[filename] = parse(Int, file_size)
            end

        end
    end
    close(f)

    println("final dir tree")
    println(dir_tree)

    size, flattened_dir = _get_flattened_dirs_file_size(dir_tree)

    println(flattened_dir)

    #total_size = get_total_size(flattened_dir)

    min_size_delete = flattened_dir["rootroot"] - max_size
    println("min size to delete ", min_size_delete)

    size_delete = get_min_size_over(flattened_dir, min_size_delete)


    return size_delete
end

solution = get_total_size_of_delete("input.txt")
println(solution)


function test_solution()
    return get_total_size_of_delete("test_input.txt")
end

println("test solution result:")
println(test_solution())