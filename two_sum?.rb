def two_sum?(arr, target_sum) #O(n^2)
  arr.each_with_index do |u, i| 
    arr.each_with_index do |v, j| 
      if i != j && u + v == target_sum 
        return true 
      end 
    end 
  end 
  false 
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false 

def okay_two_sum?(arr, target_sum) #(n log n)
  arr.sort!
  i, j = 0, -1
  until arr[i] + arr[j] == target_sum
    if arr[i] + arr[j] > target_sum
      j -= 1
    elsif arr[i] + arr[j] < target_sum
      i += 1
    end
     return false if i > j.abs
  end
  true
end

p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false 

def best_two_sum?(arr, target_sum) # O(n)
  hash = Hash.new
  arr.each_with_index do |u, i|
    return true if hash.has_key?(target_sum - u) 
    hash[u] = i unless hash.has_key?(u) 
  end 
  false 
end


p best_two_sum?(arr, 6) # => should be true
p best_two_sum?(arr, 10) # => should be false 