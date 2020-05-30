require 'pry'

class Node
  attr_accessor :val, :next_node

  def initialize(val=nil, next_node=nil)
    @val = val
    @next_node = next_node
  end

  def tail?
    self.next_node == nil
  end
end

class LinkedList
  attr_accessor :list, :read
  def initialize(val=nil)
    @list = Node.new(val, nil)
    @read = @list
    @count = 0
  end

  def read_next
    @read = @read.next_node
  end

  def reset_read
    @read = @list
  end

  def append(val)
    if read.tail?
      read.next_node = Node.new(val)
      reset_read
    else
      @read = @read.next_node
      append(val)
    end
  end

  def prepend(val)
    new_head = Node.new(val, @list)
    @list = new_head
    reset_read
  end

  def size
    
  end

  def to_s
    string = []
    loop do
      string << "{ #{read.val} }  =>"
      break if read.tail?
      @read = read.next_node
    end
    reset_read
    string << 'nil'
    string.join(' ')
  end

end

x = LinkedList.new('greg')

x.prepend('jeff')
x.append('james')
x.append('john')
x.prepend('bob')


puts x.to_s



