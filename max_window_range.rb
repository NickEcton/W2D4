def windowed_max_range(array, window_size) #O(n * k)
  current_max_range = nil 
  array.each_with_index do |u, i| 
    break if i + window_size - 1 >= array.length
    max = array[i..i + window_size - 1].max 
    min = array[i..i + window_size - 1].min
    current_max_range.nil? ? current_max_range = max - min : current_max_range = [current_max_range, max - min].max
  end 
  current_max_range
end 

class MyQueue
  def initialize
    @store = []
  end
  
  def peek
    @store[0]
  end
  
  def size
    @store.length
  end
  
  def empty?
    @store.empty?
  end
  
  def enqueue(el)
    @store.push(el)
  end
  
  def dequeue
    @store.shift
  end
end

class MyStack
  def initialize
    @store = []
  end
  
  def peek
    @store[-1]
  end
  
  def size
    @store.length
  end
  
  def empty?
    @store.empty?
  end
  
  def pop
    @store.pop
  end
  
  def push(el)
    @store.push(el)
  end
end

class StackQueue
  def initialize
    @in_store = MyStack.new
    @out_store = MyStack.new
  end
  
  def size
    @in_store.size + @out_store.size
  end
  
  def empty?
    @in_store.empty? && @out_store.empty? 
  end
  
  def enqueue(el)
    @in_store.push(el)
    el
  end
  
  def dequeue
    if @out_store.empty?
      until @in_store.empty?
        @out_store.push(@in_store.pop)
      end
    end
    @out_store.pop
  end
end

# queue = StackQueue.new
# p queue.enqueue(1)
# p queue.enqueue(2)
# p queue.dequeue
# p queue.enqueue(3)
# p queue.dequeue
# p queue.enqueue(4)
# p queue.enqueue(5)
# p queue.dequeue

class MinMaxStack
  def initialize
    @store = []
  end
  
  def peek
    @store[-1][0]
  end
  
  def peek_all
    @store[-1]
  end
  
  def size
    @store.length
  end
  
  def empty?
    @store.empty?
  end
  
  def pop
    @store.pop[0]
  end
  
  def push(el)
    last_el = peek_all
    if empty?
      arr = [el, el, el]
    else
      arr = [el, [el, last_el[1]].max, [el, last_el[2]].min]
    end
    @store.push(arr)
    arr
  end
  
  def max
    peek_all[1]
  end
  
  def min
    peek_all[2]
  end
end

class MinMaxStackQueue 
  
  def initialize
    @in_store = MinMaxStack.new
    @out_store = MinMaxStack.new
  end
  
  def peek 
    @out_store.peek_all
  end
  
  
  def size
    @in_store.size + @out_store.size
  end
  
  def empty?
    @in_store.empty? && @out_store.empty? 
  end
  
  def enqueue(el)
    until @out_store.empty? 
      @in_store.push(@out_store.pop)
    end 
    @in_store.push(el)
    until @in_store.empty?
      @out_store.push(@in_store.pop)
    end 
  end
  
  def dequeue
    @out_store.pop[0]
  end
  
  def min 
    peek[-1]
  end 
  
  def max 
    peek[1]
  end 
end 

def new_window_max_range(array, window_size) #O(n)
  our_queue_stack = MinMaxStackQueue.new 
  (0...window_size).each { |el| our_queue_stack.enqueue(array.shift)}
    current_max_range = our_queue_stack.max - our_queue_stack.min
    while array.length > 0 
      our_queue_stack.dequeue
      our_queue_stack.enqueue(array.shift)
      if our_queue_stack.max - our_queue_stack.min > current_max_range
        current_max_range = our_queue_stack.max - our_queue_stack.min
      end 
    end 
  current_max_range
end 




p new_window_max_range([1, 0, 2, 5, 4, 8], 2) # 4, 8
p new_window_max_range([1, 0, 2, 5, 4, 8], 3)# 0, 2, 5
p new_window_max_range([1, 0, 2, 5, 4, 8], 4)# 2, 5, 4, 8
p new_window_max_range([1, 3, 2, 5, 4, 8], 5) # 3, 2, 5, 4, 8

