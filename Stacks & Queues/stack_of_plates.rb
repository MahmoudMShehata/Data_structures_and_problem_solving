
def restack_and_push(stack, sub_stack_limit, value = nil)
	extra = []
	stack.each do |st|
		while st.length > sub_stack_limit 
			extra << st.pop
		end
	end

	i = 0 
	extra.each do |val|
		while stack[i].length == sub_stack_limit
			stack += stack[i+1] || stack[i+1] = [] if stack[i+1] == nil
			i += 1
		end

		stack[i].push(val)
	end

	if value != nil
		stack[i+1] = [] if !stack[i+1]
		stack[i+1] << value
	end


	puts "New restacked stack :"
	stack.each do |st|
		puts st.join(", ")
	end
end

def pop_at(stack, i)
	puts "sub-stack ##{i+1} popped value = #{stack[i].pop}"
end

stack = [[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16], [9,8,7,6,5,4,3,2], [], [2,5,6,1,2,3]]
restack_and_push(stack, 5)
pop_at(stack, 3)
