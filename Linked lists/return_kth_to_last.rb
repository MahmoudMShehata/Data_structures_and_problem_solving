
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
      starting_node = @head
    end

    current_node = starting_node

    while current_node.next_node != nil
      if current_node.next_node.value == value
        current_node.next_node = current_node.next_node.next_node
        @length -= 1

        if delete_only_one
          return nil
        end
      else
        current_node = current_node.next_node
      end
    end

    nil
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

  def print_kth_to_last(k = 0)
    current_node = @head.next_node
    values = []
    i = 1

    while current_node != nil
        values << current_node.value if i >= k
        current_node = current_node.next_node
        i += 1
    end
      

    puts values.join(" -> ")
  end


  def length
    return @length
  end

  def remove_duplicates
    current_node = @head.next_node

    while current_node != nil
      delete_node(current_node.value, false, current_node)
      current_node = current_node.next_node
    end
  end
end

list = LinkedList.new

list.append(2)
list.append(3)
list.append(7)
list.append(4)
list.append(3)
list.append(4)
list.append(9)
list.print_list

#list.remove_duplicates
list.print_kth_to_last()
