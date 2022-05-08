class Node

	attr_accessor :value, :next_node

	def initialize(value, next_node)
		@value     = value
		@next_node = next_node
	end
end

class LinkedList
	def initialize()
		@head   = Node.new(nil, nil)
		@length = 0
	end

	def append(value)
	    current_node = @head

	    while current_node.next_node != nil
	      current_node = current_node.next_node
	    end

	    current_node.next_node = Node.new(value, nil)
	    @length += 1
  end


  # return first node with the desired value f found, or return nil
  def find_first(value)
    current_node = @head

    while true
      current_node = current_node.next_node
      return nil if current_node == nil

      if current_node.value == value
        return current_node
      end
    end
  end

  def delete_node(value, delete_only_one = true, starting_node = nil)
  	if starting_node.nil?
  		current_node = @head
  	end

  	starting_node = current_node

  	while current_node.next_node != nil

  		if current_node.value == value
  			current_node.next_node = current_node.next_node.next_node

  			if delete_only_one
  				return nil
  			end
  		else
  			current_node = current_node.next_node
  		end
  	end

  end

  def print_list
    current_node = @head.next_node

    values = []
    while current_node != nil
      values << current_node.value
      current_node = current_node.next_node
    end

    puts values.join(" -> ")
  end

  def length
    return @length
  end

  def partition(val = 0)
  	current_node = @head.next_node
  	arr = []

  	while current_node != nil
  		if current_node.value < val
  			arr << current_node.value
  			current_node = current_node.next_node
  		else
  			current_node = current_node.next_node
  		end
  	end

  	current_node = @head.next_node

  	while current_node != nil
  		if current_node.value >= val
  			arr << current_node.value
  			current_node = current_node.next_node
  		else
  			current_node = current_node.next_node
  		end
  	end

  	puts arr.join(" -> ")
  end

end


list = LinkedList.new
list.append(3)
list.append(5)
list.append(8)
list.append(5)
list.append(10)
list.append(2)
list.append(1)

list.print_list

list.partition(5)