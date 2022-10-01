class BST_Set #Class for our sets in tree form
  def initialize()
    @root = nil
  end

  def add(givenVal) #Adds the passed in number to this set, unless its duplicate
    if @root == nil #if this set is empty the new node goes at the root
      @root = TreeNode.new(givenVal)
    else
      curNode = @root #Copy of root to traverse without changing root
      prevNode = @root #prev set to same as cur for now

      while curNode != nil
        prevNode = curNode
        if givenVal == curNode.val #We're making sets so NO REPEATS ALLOWED!!
          puts "\e[#{33}m    Warning:\e[0m Duplicates not allowed. Keeping only single instance of #{givenVal}\n"
          return
        elsif givenVal < curNode.val #given value is less than current so it must go on the left
          curNode = curNode.leftNode
        else #given value is bigger than currents so it must go on the right
          curNode = curNode.rightNode
        end
      end
      # Now add the new node whever prev ended up
      if givenVal < prevNode.val
        prevNode.leftNode = TreeNode.new(givenVal)
      else
        prevNode.rightNode = TreeNode.new(givenVal)
      end
    end
  end

  def clear #for clearing out a tree by cutting the root
    @root = nil
  end

  def _map(rootNode, givenFunction, isPreOrder, isPrinting) #Applies given function to all members of tree
    return if rootNode.nil?
    moddedVal = nil
    unless isPreOrder #goes from left to right
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

  def map(givenFunction, isPreOrder: false, isPrinting: false) #helper function to abstract away passing in root
    _map(@root, givenFunction, isPreOrder, isPrinting)
  end

  def to_s #override of to string, returns  values inside parenthesis & comma separated
    s = ""
    map(->(val) { s += "#{val}, " })
    "(#{s[0...-2]})"
  end

  def contains?(givenVal) #Checks if value is present in ~O(logN) time
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

  class TreeNode #Subclass for our nodes
    attr_accessor :leftNode, :rightNode, :val #getters and setters

    def initialize(givenVal) #When new node is made sets the value and sets leafs to nil
      @leftNode = nil
      @rightNode = nil
      @val = givenVal
    end
  end
end
