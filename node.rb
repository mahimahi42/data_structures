class Node
    attr_reader :value
    attr_accessor :parent, :left, :right

    def initialize(value = 0, parent = nil, left = nil, right = nil)
        @value = value
        @parent = parent
        @left = left
        @right = right
    end
end
