def sort_stack(stack1)

	length    = stack1.length
	min       = stack1.pop
	stack3    = [] << min
	stack2, i = [], 0

	while i < length
		while stack1[-1] != nil
			if stack1[-1] < min
				min = stack1[-1]
				stack1.pop
				stack3 << min	
			else
				stack3 << stack1.pop
			end
		end
		
		i += 1

		while stack3[-1] != nil
		    if stack3[-1] == min
		       stack3.pop
		    else
		       stack1 << stack3.pop
		    end
    	end

		stack2 << min
		min = 99999999999999999999999999999999999999999

		if i == 5
			break
		end
	end

	while stack2[-1] != nil
		stack3 << stack2.pop
	end
	stack3
end


stack1 = [7,3,2,1,4]

sort_stack(stack1)

