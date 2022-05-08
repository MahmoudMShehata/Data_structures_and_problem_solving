#using single array to implement 3 stacks


stack_of_stacks = []
stack_of_stacks.push([1,2,3])
stack_of_stacks.push([4,5,6])
stack_of_stacks.push([7,8,9])

puts "popping from 2nd stack : #{stack_of_stacks[1].pop}"

#pushing element into 3rd stack

stack_of_stacks[2].push(10)

puts "updated 2nd stack : #{stack_of_stacks[2].join(",")}"