class TreeNode
   attr_accessor :value, :left, :right

   def initialize(val)
     @value = val
     @left = nil
     @right = nil
   end
end

def print_infix(node)
  return if node == nil
  print_infix(node.left)
  print node.value + " "
  print_infix(node.right)
end

# Starting at node root, check if node has children. If so, move down to the next node on the left.
# Continue down left branch until you reach a node with no children. Print it's parent.
# Traverse back up the tree, printing parents until root is reached and printed.
# Traverse down root's right branch doing the same as above.
def operators(node)
  return if node == nil
  operators(node.left)
  if node.left != nil || node.right != nil
    print node.value + " "
  end
  operators(node.right)
end

# Starting at root, travel down the left branch until a node with no child is found, and print that node.
# Go up to it's parent, and down it's right branch, printing any node without a child.
# Repeat until the right most branch is completed.
def non_operators(node)
  return if node == nil
  non_operators(node.left)
  if node.left.nil? || node.right.nil?
    print node.value + " "
  end
  non_operators(node.right)
end

# Method to return the number of leaves.
def leaves(node)
  return 1 if /\d+/.match(node.value)
  return (leaves(node.left) + leaves(node.right))
end

# Method to return number of operators. Not currently working.
def ops(node)
  if node.left.nil? || node.right.nil?
    return 1 if /[\+\-\*\%\/\.]/.match(node.value)
  else
    return (ops(node.left) + ops(node.right))
  end
end


# Start at root node, print root node
# print node.left all the way down the branch
# print node.right all the way up the branch until returned to root
# print root node's right branch
# then root.right.left all the way down
# then root.right.right all the way up
def print_prefix(node)
  return if node.nil?
  print node.value + " "
  print_prefix(node.left)
  print_prefix(node.right)
end

# start at root node, traverse all the way down left until reaching a node with no child.
# print first node with no child.
# Go up to parent node, traverse down right branch, print node with no child
# print parent, go up to parent's parent.
# print right no child node, print parent
# repeat until root is printed.
def print_postfix(node)
  return if node.nil?
  print_postfix(node.left)
  print_postfix(node.right)
  print node.value + " "
end

# Starting at root, traverse down tree
# If node has no children, go up to parent
# Check if parent is operator, print if so
# Repeat down all branches
def operator_found(node, operator)
 return if node.nil?
 operator_found(node.left, operator)
 if !node.left.nil? || !node.left.nil?
   if node.value == operator
     print "Yes! '#{node.value}' does appear! "
   end
 end
 operator_found(node.right, operator)
end


#### IN CLASS TEST CASES ####
# root = TreeNode.new("+")
# root.left = TreeNode.new("3")
# root.right = TreeNode.new("2")
# print_infix(root)
# puts "\n"
# operators(root)
# puts "\n"
# non_operators(root)
# puts "\n"
# print_prefix(root)
# puts "\n"
# print_postfix(root)
# puts "\n"
# operator_found(root, "+")
# operator_found(root, "-")
#
# puts "\n"
# puts "\n"
#
# new_root = TreeNode.new("+")
# new_root.left = TreeNode.new("3")
# new_root.right = TreeNode.new("-")
# new_root.right.left = TreeNode.new("2")
# new_root.right.right = TreeNode.new("10")
# print_infix(new_root)
# puts "\n"
# operators(new_root)
# puts "\n"
# non_operators(new_root)
# puts "\n"
# print_prefix(new_root)
# puts "\n"
# print_postfix(new_root)
# puts "\n"
# operator_found(new_root, "+")
# operator_found(new_root, "-")
#
# puts "\n"
# puts "\n"
#
# newer_root = TreeNode.new("+")
# newer_root.left = TreeNode.new("*")
# newer_root.left.left = TreeNode.new("4")
# newer_root.left.right = TreeNode.new("3")
# newer_root.right = TreeNode.new("2")
# print_infix(newer_root)
# puts "\n"
# operators(newer_root)
# puts "\n"
# non_operators(newer_root)
# puts "\n"
# print_prefix(newer_root)
# puts "\n"
# print_postfix(newer_root)
# puts "\n"
# operator_found(newer_root, "+")
# operator_found(newer_root, "-")
#
# puts "\n"
# puts "\n"

newest_root = TreeNode.new("-")
newest_root.left = TreeNode.new("+")
newest_root.left.left = TreeNode.new("*")
newest_root.left.left.left = TreeNode.new("4")
newest_root.left.left.right = TreeNode.new("3")
newest_root.left.right = TreeNode.new("2")
newest_root.right = TreeNode.new("%")
newest_root.right.left = TreeNode.new("10")
newest_root.right.right = TreeNode.new("5")
print_infix(newest_root)
puts "\n"
operators(newest_root)
puts "\n"
non_operators(newest_root)
puts "\n"
print_prefix(newest_root)
puts "\n"
print_postfix(newest_root)
puts "\n"
operator_found(newest_root, "+")
operator_found(newest_root, "-")
puts "\n"
puts leaves(newest_root)
puts ops(newest_root)

puts "\n"
puts "\n"

### ADDITIONAL TEST CASES ###
# 7 + 9
# test1 = TreeNode.new("+")
# test1.left = TreeNode.new("7")
# test1.right = TreeNode.new("9")
# print_prefix(test1)
# puts "\n"
# print_infix(test1)
# puts "\n"
# print_postfix(test1)
# puts "\n"
# operators(test1)
# puts "\n"
# non_operators(test1)
# puts "\n"
# operator_found(test1, "+")
# operator_found(test1, "-")
#
# puts "\n\n"
#
# # 4 * 12 / 3
# # ((4 * 12) / 3)
# test2 = TreeNode.new("/")
# test2.left = TreeNode.new("*")
# test2.left.left = TreeNode.new("4")
# test2.left.right = TreeNode.new("12")
# test2.right = TreeNode.new("3")
# print_prefix(test2)
# puts "\n"
# print_infix(test2)
# puts "\n"
# print_postfix(test2)
# puts "\n"
# operators(test2)
# puts "\n"
# non_operators(test2)
# puts "\n"
# operator_found(test2, "+")
# operator_found(test2, "*")
#
# puts "\n\n"
#
# # 7 - 8 * 2
# # 7 - (8 * 2)
# test3 = TreeNode.new("-")
# test3.left = TreeNode.new("7")
# test3.right = TreeNode.new("*")
# test3.right.left = TreeNode.new("8")
# test3.right.right = TreeNode.new("2")
# print_prefix(test3)
# puts "\n"
# print_infix(test3)
# puts "\n"
# print_postfix(test3)
# puts "\n"
# operators(test3)
# puts "\n"
# non_operators(test3)
# puts "\n"
# operator_found(test3, "+")
# operator_found(test3, "-")
