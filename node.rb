class Node
    attr_reader :value
    attr_accessor :parent, :children

    def initialize(value = 0, parent = nil, children = nil)
        @value = value
        @parent = parent
        if children.nil? then @children = []
        else @children = children
        end
    end
end
