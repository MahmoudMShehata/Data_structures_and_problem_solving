
class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node)
    @value     = value
    @next_node = next_node
  end
end


class LinkedList

  attr_accessor :head
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

  def return_kth_element_to_reference
    current_node = @head
    k = 0

    while current_node.next_node != nil 
      current_node = current_node.next_node
      k += 1
    end
    current_node
  end
  def head
    current_node = @head
    current_node
  end

end


class Circulate
  def circulate(list)

    current_node = actual_head = list.head.next_node

    while current_node != nil and current_node.next_node != nil
      current_node = current_node.next_node
    end
    current_node.next_node = actual_head
    actual_head
  end

  def circular_linked_list_detection(list, actual_head)

    current_node = list.head.next_node
    actual_head = list.head.next_node
    i = 1

    while i < list.length
      current_node = current_node.next_node
      i += 1
    end

    if current_node.next_node == actual_head
      return puts "The list is circular! NEVER attempt to print it's values!"
    else
      return puts "The list isn't circular."
    end
  end

end



list1 = LinkedList.new
list1.append(1)
list1.append(2)
list1.print_list

list2 = LinkedList.new
list2.append(5)
list2.append(7)
list2.append(2)
list2.append(4)


cir = Circulate.new
cir.circulate(list1)
cir1 = Circulate.new
cir2 = Circulate.new

cir1.circular_linked_list_detection(list1, list1.head)
cir2.circular_linked_list_detection(list2, list2.head)