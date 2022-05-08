class Node 

	attr_reader :value, :level
	attr_accessor :right, :left

	def initialize(value, right, left, level)
		@value = value 
		@right = right
		@left = left
		@level = level
	end
end

class Tree

	def initialize(value)
		@root = Node.new(value, nil, nil, 1)
		@hash = Hash.new
	end

	def add(new_value)

		if @root == nil
	    	@root = Node.new(new_value, nil, nil, 1)
	  	end

	  	current              = @root
	  	level                = 1
		@hash[current.value] = 1

		while(true)
		  if new_value >= current.value
		    if current.right == nil
		      	current.right = Node.new(new_value, nil, nil, level+1)
		      	@hash[current.right.value] = level+1
		        break
		    else
		        current = current.right
		        level += 1
		    end

		  else
		    if current.left == nil
		       current.left = Node.new(new_value, nil, nil, level+1)
		       @hash[current.left.value] = level+1
		       break
		    else
		       current = current.left
		       level += 1
		    end
		  end
		end
	end

	def head
		@root
	end

	def find(val)

	  	if @root == nil
	  		return puts "Tree is empty"
	  	end

	  	current = @root
	  	while current != nil
	  		if val == current.value
	  			return puts "found!"
	  		else
	  			if val < current.value
	  				current = current.left
	  			else
	  				current = current.right
	  			end
	  		end
	  	end

	  	puts "sorry, #{val} isn't found in the tree."
	end

	def treeSize(node)
		if (node != nil) 
			return self.treeSize(node.left) + 
	              self.treeSize(node.right) + 1
		else
			return 0
		end
	end

	def myhash
		@hash
	end

	def largest_hash_key
  		x = @hash.max_by{|k,v| v}
  		x[1]
	end

	def linkedlists
		arr, i = [], 1

		while i <= largest_hash_key
			current = linked = Node.new(nil, nil, nil, nil)
			myhash.each do |key, value|
					if value == i 
						if linked.right == nil
							linked.right = Node.new(key, nil, nil, nil)
							linked = linked.right
						else
							linked = linked.right
						end
					end
			end

			arr << current
			i += 1
		end
		arr
	end

end


tree = Tree.new(7)
tree.add(6)
tree.add(11)
tree.add(4)
tree.add(5)
tree.add(8)
tree.add(15)
tree.add(7)
tree.add(9)

p tree.linkedlists[3]

