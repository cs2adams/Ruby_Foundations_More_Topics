# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')


# MY OBSERVATIONS
#
# Calling puts on a proc object prints a String representation
# of the Proc (likely using the Object #to_s method to create
# the String representation) Interestingly, the filename
# and line number are included in the String representation of the Proc
# object that gets printed. I assume that this is so that Ruby
# can easily evaluate the binding of the Proc object, even if
# it is called from another .rb file.
#
# Calling puts on the Proc class prints "Proc", as expected.
#
# Calling the proc with no arguments results in the single
# block parameter evaluating to nil. Printing that block
# parameter via String interpolation therefore prints an empty
# String
#
# When the proc is called with a single  argument, then
# it works as expected and the argument gets mapped to the
# single block parameter. The parameter is printed to the 
# terminal via String interpolation.
#
# This demonstrates the lenient arity of Proc objects. The
# proc can be called with fewer arguments than there are
# block parameters, and the unmatched block parameters will
# simply evaluate to nil

# # Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }


# MY OBSERVATIONS
#
# When puts is called on the lambdas, the output is nearly identical
# to that of the Proc from group one. The String representation
# of the Lambdas indicates that they are Procs, and gives the file
# name nad line number where they are defined. The one difference
# from the Proc in Group 1 is that the output now says "(lambda)"
# at the very end of the line.
#
# It appears from the output of puts that the two syntaxes used to
# define my_lambda and my_second_lambda are equivalent in how they
# are evaluatedby Ruby.
#
# Calling puts on the class of a lambda prints Proc to the terminal.
# It appears that lambdas are a special type of Proc object.
#
# Calling the lambda with a single argument works as expected.
# The lambda has a single block parameter which is assigned
# the argument, and the code executes as expected.
# Unlike with the basic Proc object in Group 2, calling the lambda
# with no argument raises an ArgumentError. It appears that lambdas
# are a special type of Proc with strict arity.
# 
# Creating a new lambda with the Lambda.new method raises
# a NameError with message "uninitialized constant Lambda".
# This is consistent with the observations above. Lambda is not a class,
# and so Ruby is not able to initialize Lambda objects. All lambdas
# are objects of the Proc class.


# # Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')

# MY OBSERVATIONS
#
# Calling the block method with two arguments (one String and one block)
# allows the method to work as expected. The method yields to the block,
# and the block executes. The yield method does not automatically pass in
# the method parameters to the block (as does super). So the block, which
# contains one block parameter, evaluates its block parameter as nil. Explicitly
# passing the String parameter to the block with yield would have allowed
# the block to use this parameter in its output message (as desired). This again
# demonstrates the lenient arity of blocks.
#
# Calling the method with no block parameter raises a LocalJumpError. This
# occurs because there is no guard clause on the yield method call to first
# check if a block was given. If the desire is for the method to be able to
# execute with or without a block argument, the method should
# first check if a block was given and only yield to the block if it is found.

# # Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

# MY OBSERVATIONS
#
# Calling the block method with a String argument and a block argument
# works as expected. The String argument is explicitly passed to the block
# by the yield method call, and the block assigns the String to its single
# block parameter and prints it to the terminal via String interpolation.
#
# The second call to block_method_2 again demonstrates the lenient arity of
# blocks in Ruby. As before, a single String object is passed to the block
# by yield, but this time the block contains two block parameters. The String
# is assigned to the first block parameter, and the second block parameter is
# assigned a value of nil. The block executes without raising any exceptions.
#
# In the third and final call to block_method_2, the yield method again
# explicitly passes the String to the block parameter. However, the block does
# not include any block parameters. This would normally not be a problem due to
# the lenient arity of blocks; the parameter that was passed in simply gets ignored
# by the block. However, the code raises a NameError because it attempts
# to print the "animal" variable via Stirng interpolation. Since this variable
# is ignored by the block (and not assigned to any block parameter), and since
# blocks are scoped based on their binding, the animal variable, which is in the
# local scope of the block_method_2 method, is not in scope for the block. This
# despite the fact that the block is yielded to from within that method.


# CLOSING THOUGHTS
# Procs have lenient arity. Lambdas are a special type of Proc objecct with strict
# arity. Blocks are closures that are made for "one time use" and can't be assigned
# to variables. Blocks have lenient arity. Blocks are called wth the yield
# keyword, which will raise a LocalJumpError if no block argument were given.
