require_relative "BST_Set.rb"
setA = BST_Set.new
setA.add(3)
setA.add(4)
setA.add(10)
setA.add(11)
setA.add(12)
setA.add(13)
setA.add(14)

puts "Set A: #{setA}"
puts "does Set A contain 4? #{if setA.contains?(4) then "Yes" else "No" end}"
puts "does Set A contain 5? #{if setA.contains?(5) then "Yes" else "No" end}"
setA.add(6.0)
puts "does Set A contain 6? #{if setA.contains?(6) then "Yes" else "No" end}"
