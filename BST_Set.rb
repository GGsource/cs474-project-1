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

  def _map(rootNode, givenFunction, isPreOrder, isPrinting)
    return if rootNode.nil?
    moddedVal = nil
    unless isPreOrder
      _map(rootNode.leftNode, givenFunction, isPreOrder, isPrinting)
      moddedVal = givenFunction.call(rootNode.val)
      puts "#{moddedVal}" if isPrinting
      _map(rootNode.rightNode, givenFunction, isPreOrder, isPrinting)
    else #If called with isBreadthFirst true,
      givenFunction.call(rootNode.val)
      _map(rootNode.leftNode, givenFunction, isPreOrder, isPrinting)
      _map(rootNode.rightNode, givenFunction, isPreOrder, isPrinting)
    end
  end

  def map(givenFunction, isPreOrder: false, isPrinting: false)
    _map(@root, givenFunction, isPreOrder, isPrinting)
  end

  def to_s
    s = ""
    map(->(val) { s += "#{val}, " })
    "(#{s[0...-2]})"
  end

  def contains?(givenVal) #Returns value in ~O(logN) time
    traveler = @root
    until traveler.nil?
      if traveler.val == givenVal
        return true
      elsif givenVal < traveler.val
        traveler = traveler.leftNode
      elsif givenVal > traveler.val
        traveler = traveler.rightNode
      end
    end
    return false #We could have simply mapped but that would be inefficient O(N) time
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
