#############################################################################################
# Author: Geo Gonzalez
# Name: main.rb
# Date: September 28th 2022
# Description: This file contains the main content of the command-line program, the
# main loop of the project. the valid command line arguments are defined here!
#############################################################################################
require_relative "BST_Set" #Import the created set class
setX, setY, setZ = BST_Set.new, BST_Set.new, BST_Set.new #Our 3 main sets, beginning as null
puts "Hello, welcome to CS474 Project 1!" # Greet the user
until false #Infinite Loop until forced to break
  # Tell user what commands they can use
  puts "  ┌ X values - Takes a comma-separated list of numeric arguments denoted by values and puts them into X, replacing anything previous.
  ├ Y values - Takes a comma-separated list of numeric arguments denoted by values and puts them into Y, replacing anything previous.
  ├ Z values - Takes a comma-separated list of numeric arguments denoted by values and puts them into Z, replacing anything previous.
  ├ a i - Takes a single numeric value and inserts it into X at the appropriate location.
  ├ r - Rotates the contents of th 3 sets such that Y gets X's values, Z gets Y's values, and X gets Z's values.
  ├ s - Switches the contents of sets X and Y.
  ├ u - Creates a union of the values in sets X and Y, putting the resulting set into X. Y is cleared. 
  ├ i - Creates an intersection of the values in sets X and Y, putting the resulting set into X. Y is cleared.
  ├ c - Creates a deep copy of set X in set Y. If Y previously held contents they are lost. X and Y are independent data structures.
  ├ l - Takes a one-argument lambda and applies it to every element of X. Results are printed but X is unmodified. Ex: l ->(val){val*1000}
  └ q - Quit and exit program."
  puts "Set X: #{setX}\nSet Y: #{setY}\nSet Z: #{setZ}\n\n" # Print out the 3 sets at the end of each loop
  print "Please input your command: "                       #request their command
  input = gets.split(" ", 2)                                #Get user input & split it into command & arguments
  cmd = input[0]                                            #Command the user wants to use
  args = input[1].split(",")                                #Arguments the user is providing for the command

  # Check which command the user chose
  case cmd
  when "X".."Z" #command for filling set X, Y, or Z with new values
    args.each do |val| binding.local_variable_get("set" + cmd).add(Integer(val)) end
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
end
print "Exiting program, goodbye!"
