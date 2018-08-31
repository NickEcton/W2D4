def first_anagram?(str1, str2) #O(n!)
  arr = []
  str1.chars.permutation.each { |el| arr << el}
  arr.include?(str2.chars)
end

p first_anagram?("gizmo", "sally")
p first_anagram?("elvis", "lives") 

def second_anagram?(str1, str2) #O(n^2)
  return false if str1.length != str2.length
  str2_chars = str2.chars
  str1.chars.each do |el|
    idx = str2_chars.find_index(el)
    return false if idx == nil
    str2_chars.delete_at(idx)
  end
  return true if str2_chars.empty?
  false
end

p second_anagram?("gizmo", "sally")
p second_anagram?("elvis", "lives")
p second_anagram?("williamshakespeare", "iamaweakishspeller")

def third_anagram?(str1, str2) #O(n log n)
  str1.chars.sort == str2.chars.sort
end 

p third_anagram?("gizmo", "sally")
p third_anagram?("elvis", "lives")
p third_anagram?("williamshakespeare", "iamaweakishspeller")

def fourth_anagram?(str1, str2) #O(n)
  my_hash = Hash.new(0)
  str1.chars.each_with_index do |el, idx|
    my_hash[el] += 1 
  end  
  str2.chars.each_with_index do |el, idx|
    my_hash[el] -= 1 
  end  
  my_hash.values.to_a.all? { |v| v == 0}
end 

p fourth_anagram?("gizmo", "sally")
p fourth_anagram?("elvis", "lives")
p fourth_anagram?("williamshakespeare", "iamaweakishspeller")