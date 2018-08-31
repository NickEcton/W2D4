def my_min(arr) #O(n^2)
  small_number = 0  
  arr.each do |el|
    small_number = el if arr.all? { |el2| el <= el2}
  end
  return small_number 
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)  # =>  -5

def my_min_fast(arr) #O(n)
  retur nil if arr.empty?
  small_number = arr[0]
  arr[1..-1].each do |el|
    small_number = el if el < small_number
  end
  small_number
end

p my_min_fast(list)  # =>  -5

def largest_contiguous_subsum(list) #O(n^2)
  arr = []
  (1..list.length).each do |len|
    list.each_index do |idx| 
      arr << list[idx..idx + len - 1]
    end 
  end 
  arr.map { |el| el.reduce(:+) }.max
  
end 

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

def largest_contiguous_subsum_fast(list) #O(n)
  global_max = list[0] 
  local_max = list[0]
  list[1..-1].each do |el|
    if el + local_max > 0 && local_max > 0
      local_max += el
    else 
      local_max = el 
    end 
    global_max = [local_max, global_max].max
  end 
  global_max
end 


list = [-5, -1, -3]
p largest_contiguous_subsum_fast(list) # => -1 (from [-1])





