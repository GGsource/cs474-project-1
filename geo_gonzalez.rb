#############################################################################################
# Author: Geo Gonzalez
# Name: geo_gonzalez.rb
# Date: September 28th 2022
# Description: This file contains the main content of the command-line program, the
# main loop as well as each of the valid arguments is defined here.
#############################################################################################
require_relative "geo_gonzalez"

#############################################################################################
# Helper Functions
#############################################################################################
#setVals -
#Function for setting the given set to the given values. Commands X, Y and Z all use this.
def setVals(givenSet, args)
  givenSet = BST_Set.new
  for val in args
    givenSet.add(val.to_i)
  end
end

#############################################################################################
# End of Helper Functions
#############################################################################################
# Main Program Loop
#############################################################################################
setX, setY, setZ = nil #Our 3 main sets, beginning as null
input = nil            #Where we receive the user's raw input
args = []              #Where we will split the user's input by spaces
until args[0] == "q"
  puts "Hello, welcome to CS474 Project 1! Please input your command:"
  input = gets
  args = input.split
  if args[0] == "X" #command for filling X set
    setVals(setX, args[1..])
  elsif args[0] == "Y" #TODO: Finish commenting
    setVals(setY, args[1..])
  elsif args[0] == "Z"
    setVals(setZ, args[1..])
  else
    puts "Invalid command! Please Refer to the list command."
  end
end
puts "Exiting. Goodbye!"
#############################################################################################
# End of Main Program Loop
#############################################################################################
