
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
  attr_accessor :head
  def initialize(val=1)
    @head = Node.new(val, nil)
  end

  def append(val)
    if head.tail?
      head.next_node = Node.new(val)
    else
      head.next_node.append(val)
    end
  end

  def prepend(val)
    new_head = Node.new(val, @head)
    @head = new_head
  end

end

x = LinkedList.new('greg')

p x

x.prepend('jeff')

p x



