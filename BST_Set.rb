# TODO: Comment all these functions
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
          puts "\e[#{33}m    Warning:\e[0m Duplicates not allowed. Keeping only single instance of #{givenVal}\n"
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

  def clear
    @root = nil
    @size = 0
  end

  def to_s
    setString = printNodes(@root, "")
    "(#{setString[0...-2]})"
  end

  private def printNodes(rootNode, finalString)
    return "" if rootNode.nil?
    finalString += printNodes(rootNode.leftNode, finalString) + "#{rootNode.val}, " + printNodes(rootNode.rightNode, finalString)
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
