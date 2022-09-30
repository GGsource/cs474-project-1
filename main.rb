#############################################################################################
# Author: Geo Gonzalez
# Name: main.rb
# Date: September 28th 2022
# Description: This file contains the main content of the command-line program, the
# main loop as well as each of the valid arguments is defined here.
#############################################################################################
require_relative "BST_Set"

#############################################################################################
# Helper Functions
#############################################################################################

# setVals -
# Function for setting the given set to the given values. Commands X, Y and Z all use this.
def setVals(givenSet, args)
  for val in args
    givenNum = Integer(val) #Parse the value as an int
    givenSet.add(givenNum)
  end
end

#############################################################################################
# End of Helper Functions
#############################################################################################
# Main Program Loop
#############################################################################################
setX, setY, setZ = BST_Set.new, BST_Set.new, BST_Set.new #Our 3 main sets, beginning as null
until false #Infinite Loop until forced to break
  # Greet the user and request their command
  print "Hello, welcome to CS474 Project 1! Please input your command: "
  # TODO: List available commands so the user knows
  input = gets.split(" ", 2)    #Get user input & Split user input into command and arguments
  cmd = input[0]                #Command the user wants to use
  args = input[1].split(",")    #Arguments the user is providing for the command

  # Check which command the user chose
  case cmd
  when "X".."Z" #command for filling set X, Y, or Z with new values
    setVals(binding.local_variable_get("set" + cmd), args)
  when "a" #command for adding one additional value to set X specifically
    setX.add(args[0].to_i) unless args.length() != 1
  when "r" #command for rotating the 3 sets
    setTemp = setX; setX = setZ; setZ = setY; setY = setTemp
  when "s" #command for switching set X and Y
    setTemp = setX; setX = setY; setY = setTemp
  when "u" #command for unifying set X and Y into a combined set in X. Clears Y
    setY.map(->(val) { setX.add(val) }); setY.clear
  when "i" #command for intersecting set X and Y into a new set in X. Clears Y
    newSet = BST_Set.new; setX.map(->(val) { newSet.add(val) if setY.contains?(val) }); setX = newSet; setY.clear
  when "c" #command for deep copying set X into Y. Clears Y
    setY.clear; setX.map(->(val) { setY.add(val) }, isPreOrder: true) #isPreOrder argument changes map to preorder traversal
  when "l" #command for executing a given lambda. Example: "l ->(val){val*1000}" will print out X's values multiplied by 1000
    setX.map(eval(args[0]), isPrinting: true) #isPrinting argument changes map to print the result of its evaluation
  when "q" #User wants to quit, exit the loop
    break
  else
    # Give error message to let the user know their mistake. Colored red!
    puts "\e[#{31}m    ERROR:\e[0m #{cmd} is not a valid command! Please Refer to the command list."
  end
  # Print out the 3 sets at the end of each loop
  puts "Set X: #{setX}\nSet Y: #{setY}\nSet Z: #{setZ}"
end
print "Exiting program, goodbye!"
#############################################################################################
# End of Main Program Loop
#############################################################################################
