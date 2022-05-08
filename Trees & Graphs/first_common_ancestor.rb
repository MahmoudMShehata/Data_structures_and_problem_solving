class Node 

	attr_accessor :value, :right, :left, :level, :sub_tree

	def initialize(value, right, left, level, sub_tree)
		@value = value 
		@right = right
		@left = left
		@level = level
		@sub_tree = sub_tree
	end
end

class Tree

	def initialize(value)
		@root = Node.new(value, nil, nil, 1, "ROOT")
		@levels = 1
		@arr3 = []
		@i = 0
	end

	def add(new_value)

		if @root == nil
	    	@root = Node.new(new_value, nil, nil, 1, "ROOT")
	    	return
	  	elsif new_value >= @root.value
	  		new_node = Node.new(new_value, nil, nil, nil, "R")
	  	else
	  		new_node = Node.new(new_value, nil, nil, nil, "L")
	  	end

	  	levels = 1
		current = @root

		while(true)
		  if new_value >= current.value
		    if current.right == nil
		      	current.right = new_node
		      	new_node.level = levels + 1
		        break
		    else
		        current = current.right
		        levels += 1
		    end

		  else
		    if current.left == nil
		       current.left = new_node
		       new_node.level = levels + 1
		       break
		    else
		       current = current.left
		       levels += 1
		    end
		  end
		end
	end

	def find(val)

	  	if @root == nil
	  		return puts "Tree is empty"
	  	end

	  	@f_current = @root
	  	while @f_current != nil
	  		if val == @f_current.value
	  			return @f_current
	  		else
	  			if val < @f_current.value
	  				@f_current = @f_current.left
	  			else
	  				@f_current = @f_current.right
	  			end
	  		end
	  	end

	  	return @f_current = nil
	end

	def treeSize(node)
		if (node != nil) 
			return self.treeSize(node.left) + 
	              self.treeSize(node.right) + 1
		else
			return 0
		end
	end

	def head
		@root
	end

	def empty_array
		@arr = []
	end

	def empty_array2
		@arr2 = []
	end

	def inorder(head, empty_array)
		inorder(head.left, empty_array) if head.left
		empty_array << head
		inorder(head.right, empty_array) if head.right
		empty_array.flatten
	end

	def inorder_finder(head, empty_array2, value1, value2)
		inorder_finder(head.left, empty_array2, value1, value2) if head.left

		if head.value == value1 || head.value == value2
			curr = head
			empty_array2 << curr
			empty_array2 << curr.level
		end
		inorder_finder(head.right, empty_array2, value1, value2) if head.right

		if empty_array2.size == 4 
			empty_array2[-1] = empty_array2[1] if empty_array2[1] < empty_array2[3]
       		empty_array2[-1] = empty_array2[3] if empty_array2[3] < empty_array2[1]
			empty_array2.flatten
		end
	end

	def parent_finder(head)
		current_node = head
		parent_finder(current_node.left) if current_node.left
		if current_node == @arr3[0] || current_node == @arr3[1]
			@i += 1
		end

		parent_finder(current_node.right) if current_node.right

		if (current_node == @arr3[0] || current_node == @arr3[1]) and (current_node.right and current_node.left)
			@i += 1
		end
	end



	def parents_checker(head, nodes_references, found_nodes_and_levels)
			if found_nodes_and_levels == nil || found_nodes_and_levels.size != 4
				return puts "one or both nodes aren't found"
			end

			while (found_nodes_and_levels[-1] - @levels) != 1
				nodes_references.each do |node|
					@i = 0
					if node.level == (found_nodes_and_levels[-1] - @levels)
						current_node = node

						if @arr3.empty?
							@arr3 << found_nodes_and_levels[0]
							@arr3 << found_nodes_and_levels[2]
						end

						parent_finder(current_node)

						if @i == 2
							return puts "The nearest common parent is #{node.value}"
						end
					end
				end
			@levels += 1
		end
		puts "The nearest common parent is the root node."
	end

	def random_tree_builder(new_value)
		if @root == nil
	    	@root = Node.new(new_value, nil, nil, 1, "ROOT")
	    end

	    levels = 1
		current = @root

		while(true)
		    if current.right == nil
		      	current.right = Node.new(new_value, nil, nil, levels, "ROOT")
		      	current.right.level = levels + 1
		      	levels += 1
		        break
		    elsif current.left == nil
		        current.left = Node.new(new_value, nil, nil, levels, "ROOT")
		      	current.left.level = levels + 1
		      	levels += 1
		        break
		    elsif new_value > @root.value
		    	current = current.left
		    	levels += 1
		    else
		    	current = current.right
		    	levels += 1
		    end
		end
	end
end


tree = Tree.new(7)
tree.add(6)
tree.add(11)
tree.add(4)
tree.add(5)
tree.add(8)
tree.add(15)
tree.add(9)
tree.add(17)
tree.add(12)
tree.add(20)
tree.add(16)
tree.add(10)
tree.add(13)
tree.add(19)
nodes_references = tree.inorder(tree.head, tree.empty_array)
found_nodes_and_levels = tree.inorder_finder(tree.head, tree.empty_array2, 20, 19)
tree.parents_checker(tree.head, nodes_references, found_nodes_and_levels)


#randomtree = Tree.new(8)
#randomtree.random_tree_builder(9)
#randomtree.random_tree_builder(11)
#randomtree.random_tree_builder(7)
#randomtree.random_tree_builder(20)
#randomtree.random_tree_builder(90)
#randomtree.random_tree_builder(22)
#randomtree.random_tree_builder(100)