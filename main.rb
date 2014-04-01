require './node'

def build_tree(arr)
    root = Node.new(arr[0])
    arr[1..-1].each do |val|
        curr_node = root
        # Loop till we find where to place our value
        while true do
            # We are less or equal to than the current value
            if val <= curr_node.value then
                # No left child
                if curr_node.left.nil? then
                    curr_node.left = Node.new(val, curr_node)
                    break
                # We have a left child
                else
                    curr_node = curr_node.left
                end
            # We are greater than the current value
            else
                # No right child
                if curr_node.right.nil? then
                    curr_node.right = Node.new(val, curr_node)
                    break
                # We have a right child
                else
                    curr_node = curr_node.right
                end
            end
        end
    end
    return root
end

def print_tree(tree, spaces = 0)
    if tree.nil? then return
    else
        print_tree(tree.right, spaces + 5)
        spaces.times {|s| print " "}
        puts tree.value
        print_tree(tree.left, spaces + 5)
    end
end

def breadth_first_search(tree, target)
    queue = [tree]
    while not queue.empty? do
        curr = queue.pop
        if curr.value.eql? target then return curr end
        queue << curr.left
        queue << curr.right
    end
    return nil
end

def depth_first_search(tree, target)
    stack = [tree]
    while not stack.empty? do
        curr = stack.pop
        if curr.value.eql? target then return curr end
        stack.push curr.left
        stack.push curr.right
    end
    return nil
end

arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = build_tree(arr)

print_tree(tree)

node = depth_first_search(tree, 23)
puts node.value
