def convert(s, num_rows)
	arr                           = []
	range,         i              = (num_rows - 1), 0
	going_forward, going_backward = false     , false

	if num_rows == 1
		return s
	end

	while i < s.length
		if arr.length < num_rows 
			arr[i] = s[i]
			i += 1
		else
			if range == (num_rows - 1)
				going_backward = true
				going_forward  = false
			elsif range == 0
				going_forward  = true
				going_backward = false
			end

			if going_backward == true
				range -= 1
				arr[range] += s[i]
				i += 1
			elsif going_forward == true
				range += 1
				arr[range] += s[i]
				i += 1
			end
		end
	end
	final_str = ""
	arr.each do |string|
		final_str += string
	end
	final_str
end
	
p convert("paypalishiring", 3)