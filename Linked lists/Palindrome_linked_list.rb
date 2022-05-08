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

  def palindrome
    
    x = 1
    mid_odd  = (@length / 2) + 1 if @length % 2 != 0
    mid_even = (@length / 2)     if @length % 2 == 0


    if mid_odd
    while x < mid_odd
        current_node, k = @head.next_node, 2

        while current_node != nil and k <= mid_odd - x
           current_node = current_node.next_node
           k += 1
        end
          
        first_half_node = current_node.value
        current_node, k = @head.next_node, 2
      while current_node != nil and k <= mid_odd + x
        current_node = current_node.next_node
        k += 1
      end

      second_half_node = current_node.value

      if first_half_node == second_half_node
        x += 1
      else
        return puts "The LinkedList isn't a palindrome."
      end
    end

  else
    while x < mid_even
        current_node = @head.next_node
        even, k = 0, 2

        while current_node != nil and k <= mid_even - even
           current_node = current_node.next_node
           k += 1
        end
          
        first_half_node = current_node.value
        current_node, k = @head.next_node, 2
        
      while current_node != nil and k <= mid_even + even + 1
        current_node = current_node.next_node
        k += 1
      end

      second_half_node = current_node.value

      if first_half_node == second_half_node
        x += 1
      else
        return puts "The LinkedList isn't a palindrome."
      end
    end
  end


  puts "It's a palindrome!"
  end
    
end


list = LinkedList.new
list.append("a")
list.append("h")
list.append("m")
list.append("e")
list.append("d")
list.append("d")
list.append("e")
list.append("m")
list.append("h")
list.append("a")

list.print_list
list.palindrome
