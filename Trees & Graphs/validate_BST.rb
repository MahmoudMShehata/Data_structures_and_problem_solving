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

	def left_sub
		@root.left
	end

	def right_sub
		@root.right
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
	  	
	  	empty_array << head.value
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

    def validate_BST(arr)
    	flag = false
		while !arr.empty?
			if arr[-1] > 7
				arr.pop
			elsif arr[-1] < 7 and flag == false 
				puts "Not a BST, right sub-tree is corrupted."
				break
			elsif arr[-1] == 7
				flag = true
				break
			end
		end

		if flag == true
			arr.pop
			while !arr.empty?
				if arr[-1] < 7
					arr.pop
				elsif arr[-1] > 7
					puts "Not a BST, left sub-tree is corrupted."
					break
				end
			end
			if arr.empty?
				puts "It's a BST!"
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
#tree.head.left.left.right.value = 99
tree.add(15)
tree.add(9)
tree.add(17)
tree.add(20)
tree.add(18)
root = tree.head


x = tree.inorder(root, tree.empty_array)
tree.validate_BST(x)
