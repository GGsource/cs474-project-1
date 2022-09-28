class BST_Set
  attr_accessor :root, :size

  def initialize()
    @root = nil
    @size = 0
  end

  def add(givenVal)
    if @root == nil
      @root = TreeNode.new(givenVal)
    else
      curNode = @root
      prevNode = @root

      while curNode != nil
        prevNode = curNode
        if givenVal == curNode.val #We're making sets so NO REPEATS ALLOWED!!
          puts "BAD! Cannot put duplicate values in a set!"
          return
        elsif givenVal < curNode.val
          curNode = curNode.leftNode
        else #else the given value is bigger than currents so it must go on the right
          curNode = curNode.rightNode
        end
      end

      if givenVal < prevNode.val
        prevNode.leftNode = TreeNode.new(givenVal)
      else
        prevNode.rightNode = TreeNode.new(givenVal)
      end
    end
    @size += 1
  end

  class TreeNode
    attr_accessor :leftNode, :rightNode, :val

    def initialize(givenVal)
      @leftNode = nil
      @rightNode = nil
      @val = givenVal
    end
  end
end
