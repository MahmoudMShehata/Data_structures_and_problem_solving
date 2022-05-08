# @param {Integer} x
# @return {Integer}
def reverse(x)
	if x == 0
		return 0
	end

	if (x < 0 and -(x.to_s.reverse.to_i) < -2147483648) || (x > 0 and x.to_s.reverse.to_i > 2147483647)
		return 0 
	end

	if x > 0 
    	y = x.to_s
    else
    	y = -x.to_s
    end

    if x > 0 
    	return y.reverse.to_i
    else 
    	return -y.reverse.to_i
    end
end

p reverse(1534236469)



