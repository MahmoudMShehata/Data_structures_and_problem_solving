
class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node)
    @value     = value
    @next_node = next_node
  end
end


class LinkedList
  def initialize()
    @head = Node.new(nil, nil) # dummy node
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

  def delete_middle_node(val = nil)
    current_node = @head.next_node
    i = 0

    if val == current_node.value
      puts "List's head can't be deleted!"
      return nil
    end

    while current_node != nil
      i += 1

      if current_node.value == val and i == @length
        puts "List's last node can't be deleted!"
        return nil
      end

      if current_node.next_node != nil and current_node.next_node.value == val and current_node.next_node.next_node != nil
        current_node.next_node = current_node.next_node.next_node
        return nil
      else
        current_node = current_node.next_node 
      end

      if i == @length
        puts "node with value #{val} not found."
      end

    end
  end

end

list = LinkedList.new

list.append(1)
list.append(2)
list.append(3)
list.append(4)
list.append(5)

list.print_list
list.delete_middle_node
list.print_list

