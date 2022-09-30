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
#setVals -
#Function for setting the given set to the given values. Commands X, Y and Z all use this.
def setVals(givenSet, args)
  givenSet.clear #First clear out anything old
  for val in args
    begin
      givenNum = Float(val) #Parse the value as a float
    rescue ArgumentError #if it was not able to be made a float, notify user and stop
      puts "\e[#{31}m    ERROR:\e[0m \'#{val}\' is not a valid number! Please try again.\n"
      givenSet.clear #If we failed in the middle of adding items, we should just get rid of all of them
      break
    else
      givenSet.add(givenNum)
    end
  end
end

#############################################################################################
# End of Helper Functions
#############################################################################################
# Main Program Loop
#############################################################################################
setX, setY, setZ = BST_Set.new, BST_Set.new, BST_Set.new #Our 3 main sets, beginning as null
input = nil            #Where we receive the user's raw input
args = []              #Where we will split the user's input by spaces
until false
  print "Hello, welcome to CS474 Project 1! Please input your command: "
  input = gets
  splitInput = input.split(" ", 2)
  cmd = splitInput[0]
  args = splitInput[1].split(",")
  if cmd == "X" #command for filling Set Y with new values
    setVals(setX, args)
  elsif cmd == "Y" #command for filling Set Y with new values
    setVals(setY, args)
  elsif cmd == "Z" #command for filling Set Y with new values
    setVals(setZ, args)
  elsif cmd == "q" #User wants to quit, exit the loop
    break
  else
    # Give error message to let the user know their mistake. Colored red!
    puts "\e[#{31}m    ERROR:\e[0m #{cmd} is not a valid command! Please Refer to the command list."
  end
  puts "Set X: #{setX}\nSet Y: #{setY}\nSet Z: #{setZ}"
end
print "Exiting program, goodbye!"
#############################################################################################
# End of Main Program Loop
#############################################################################################
