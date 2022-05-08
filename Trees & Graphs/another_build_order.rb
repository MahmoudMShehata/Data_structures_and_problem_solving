class Node 
	attr_accessor :value, :neighbours, :visited

	def initialize(value, neighbours = nil, visited = false)
		@value = value
		@neighbours = []
		@visited = visited
	end
end


class Graph 

	attr_accessor :value

	def initialize(value)
		@node = Node.new(value, nil, false)
		@graph_nodes = []
		@arr = []
		@projects = []
		@i = 0
	end

	def head
		@node
	end

	def graph_nodes
		@graph_nodes
	end

	def add_to_root(value)
		if value.class == Node
			@node.neighbours << value
		else
			new_node = Node.new(value, nil, false)
			@node.neighbours << new_node
		end
	end

	def add_to_graph_nodes(arr)
		if arr.class == Node
			@graph_nodes << arr
		elsif arr.class == Array
			arr.each do |element|
				if element.class != Node
					return puts "all array elements must be Nodes."
				end
			end
			@graph_nodes << arr
		else
			return puts "#{arr.class} format cannot be imported into graph."
		end
				
	end

	def pre_order(starting_node)
		starting_node.visited = true
		@arr << starting_node.value
		starting_node.neighbours.flatten.each do |neighbour|
			if neighbour.visited == false
				pre_order(neighbour)
			end
		end
		@arr
	end

	def post_order(starting_node)
		starting_node.visited = true

		starting_node.neighbours.flatten.each do |neighbour| 
			if neighbour.visited == false
				post_order(neighbour)
			end
		end
		@arr << starting_node.value if !@arr.include?(starting_node.value)

		@graph_nodes.each do |x|
			x = @graph_nodes.pop
			
			@arr << x.value if x.visited == false and x.neighbours.empty? #and !@arr.include?(x.value)
		end
		@arr
	end

	def build_order(arr_of_projects, arr_of_dependencies)
		arr_of_dependencies.each do |project|
			if project.size != 2
				return puts "dependencies should be pairs."
			end
		end

		arr_of_dependencies.each do |project|
			if !arr_of_projects.include?(project[0] || project[1])
				return puts "dependency #{project} isn't included in the projects list."
			end
		end

		arr_of_projects.each do |project|
			project = Node.new(project, nil, false)
			@projects << project
		end
		@projects.each do |project|
			arr_of_dependencies.each do |dependency|
				if dependency[1] == project.value
					@projects.each do |target_neighbour|
					project.neighbours << target_neighbour if target_neighbour.value == dependency[0] end
				end
			end
		end

		flag = false
		head = nil

		@projects.each do |project|
			@graph_nodes << project
		end

		@projects.each do |project|
			@projects.each_with_index do |project2, i|
				if !project2.neighbours.include?(project) and project != project2 
					@i += 1
				end
					if @i == @projects.size - 1
						flag = true
						head = project
						break
					end
			end
			@i = 0
			if flag == true
				break
			end
		end
		post_order(head)
	end

	def graph_nodes
		@graph_nodes
	end
end

projs = ["a", "b", "c", "d", "e", "f"]
dependencies = [["a", "d"], ["f", "b"], ["b", "d"], ["f", "a"], ["d", "c"]]
graph = Graph.new(0)
p graph.build_order(projs, dependencies)


projs2 = ["m", "n", "o", "p", "q", "r", "s"]
dependencies2 = [["m", "n"], ["o", "m"], ["s", "o"], ["r", "o"], ["p", "r"], ["q", "s"]]
graph2 = Graph.new(0)
p graph2.build_order(projs2, dependencies2)


projs3 = ["g", "h", "i", "j", "k", "l"]
dependencies3 = [["l", "i"], ["g", "l"], ["k", "l"], ["k", "h"], ["j", "h"], ["i", "j"]]
graph3 = Graph.new(0)
p graph3.build_order(projs3, dependencies3)
