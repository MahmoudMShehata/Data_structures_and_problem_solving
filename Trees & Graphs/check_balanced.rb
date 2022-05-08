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
		@max = Node.new("NONE", 0, 0, "NONE", "NONE")
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
		      	@max.right = new_node.level if new_node.sub_tree == "R"
		      	@max.left = new_node.level if new_node.sub_tree == "L"
		        break
		    else
		        current = current.right
		        levels += 1
		    end

		  else
		    if current.left == nil
		       current.left = new_node
		       new_node.level = levels + 1
		       @max.left = new_node.level if new_node.sub_tree == "L"
		       @max.right = new_node.level if new_node.sub_tree == "R"
		       break
		    else
		       current = current.left
		       levels += 1
		    end
		  end
		end
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

	def max
		@max
	end

	def empty_array
		arr = []
	end

	def inorder(head, empty_array)
		inorder(head.left, empty_array) if head.left
		empty_array << head.value
		inorder(head.right, empty_array) if head.right
		empty_array.flatten
	end

    def preorder(head, empty_array)
	  
	    preorder(head.left, empty_array) if head.left
	    preorder(head.right, empty_array) if head.right
	    empty_array.flatten
	    
    end

    def postorder(head, empty_array)

    	postorder(head.left, empty_array) if head.left
    	empty_array << head.left.value if head.left 
    	postorder(head.right, empty_array) if head.right
    	empty_array << head.right.value if head.right 

    	empty_array << head.value if head == @root
    end

    def check_balanced
    	if (@max.right - @max.left).abs > 1
    		puts "The tree isn't balanced."
    	else
    		puts "The tree IS balanced!"
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
tree.add(20)
tree.add(18)

tree.check_balanced

p tree.inorder(tree.head, tree.empty_array)