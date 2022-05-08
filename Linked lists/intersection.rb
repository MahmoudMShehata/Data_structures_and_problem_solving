
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

  def append_by_reference(node)
    current_node = @head
    node.next_node = nil

    while current_node.next_node != nil
      current_node = current_node.next_node
    end

    current_node.next_node = node
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

  def return_kth_element_to_reference(i = 1)
    current_node = @head
    k = 0

    while current_node.next_node != nil and k < i 
      current_node = current_node.next_node
      k += 1
    end

    node = current_node
    node
  end
  
  def head
    current_node = @head
    current_node
  end

end

class IntersectionCheck
  def check(list1, list2)
    list1_head, list2_head = list1.head  , list2.head
    length1   , length2    = list1.length, list2.length
    list1     , list2      = list1.head  , list2.head
    k                      = 0

    while list2.next_node != nil
      list1, i = list1_head, 1

      while list1.next_node != nil and i <= length1
        if list1.next_node == list2.next_node
          return puts "The 2 linked lists intersect @list1's #{i} node!"
        else
          list1 = list1.next_node
          i += 1
        end
      end

      list2 = list2.next_node
      k     += 1

      if k == length2
        return puts "The 2 linked lists don't intersect."
      end
    end
  end
end





list1 = LinkedList.new
list1.append(1)
list1.append(2)
list1.append(3)
list1.print_list

list2 = LinkedList.new
list2.append(5)
list2.append(6)
list2.append(7)
list2.append(11)
list2.print_list

ref = list2.return_kth_element_to_reference(4)
list1.append_by_reference(ref)
checking = IntersectionCheck.new
checking.check(list1, list2)