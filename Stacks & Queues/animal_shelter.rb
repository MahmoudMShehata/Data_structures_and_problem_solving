def enqueue(queue, value)
	queue << value
end

def dequeue_any(queue)
	puts "Here's your new pet --> #{queue.shift}"
end

def dequeue_cat(queue)
	to_be_returned = []

	if queue.empty?
		return puts "sorry, we're out of cats :("
	end

	while !queue.empty? 
		oldest_cat = queue.shift
		if !oldest_cat.include? "cat"
			to_be_returned << oldest_cat
		else
			return puts "Here's your new pet cat :D #{oldest_cat}"
		end

		if queue[0] == nil
			return puts "sorry, we're out of cats :("
		end 
	end
	queue.unshift(to_be_returned)
end

def dequeue_dog(queue)
	to_be_returned = []


	if queue.empty?
		return puts "sorry, we're out of dogs :("
	end

	while !queue.empty?
		oldest_dog = queue.shift
		if !oldest_dog.include? "dog"
			to_be_returned << oldest_dog
		else
			return puts "Here's your new pet dog :D #{oldest_dog}"
		end

		if queue[0] == nil
			return puts "sorry, we're out of dogs :("
		end 

	end
	queue.unshift(to_be_returned)
end


queue = []


enqueue(queue, "cat1")
enqueue(queue, "dog1")
enqueue(queue, "cat3")

dequeue_cat(queue)

dequeue_dog(queue)
dequeue_dog(queue)
