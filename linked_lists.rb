require 'pry'

class Node
  attr_accessor :val, :next_node
  attr_reader :pos

  def initialize(val=nil, next_node=nil)
    @val = val
    @next_node = next_node
  end

  def tail?
    self.next_node == nil
  end
end

class LinkedList
  attr_accessor :list, :read, :tmp
  def initialize(val=nil)
    @list = Node.new(val, nil)
    @read = @list
    @tmp = @read
    @pos = 0
  end

  def read_next
    @read = @read.next_node
    @tmp = @read
    @pos += 1
  end

  def reset_read
    @read = @list
    @pos = 0
  end

  def head 
    list
  end

  def tail
    until read.tail? do
      read_next
    end
    reset_read
    tmp
  end

  #allow app/prepend to add multiple elements
  def append(val)
    if read.tail?
      read.next_node = Node.new(val)
      reset_read
    else
      read_next
      append(val)
    end
  end

  def prepend(val)
    new_head = Node.new(val, @list)
    @list = new_head
    reset_read
  end

  def size
    count = 1
    until read.tail? do
      count += 1
      read_next
    end
    reset_read
    count
  end

  def to_s
    string = []
    loop do
      string << "{ #{read.val} }  =>"
      break if read.tail?
      read_next
    end
    reset_read
    string << 'nil'
    string.join(' ')
  end

  def at(idx)
    return "Error: Index[#{idx}] equals or exceeds list length." if idx >= self.size
    until @pos == idx do
      read_next
    end
    reset_read
    tmp
  end

  def pop
    puts self.tail.val
    self.at(self.size - 2).next_node = nil
  end

end

x = LinkedList.new('greg')

x.prepend('jeff')
x.append('james')
x.append('john')
x.prepend('bob')

puts x.to_s
x.pop
puts x.to_s

