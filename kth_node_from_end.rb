# Find the kth node from the end of a singly-linked list
class Node
  attr_reader :value
  attr_accessor :next

  def initialize(value, next_node = nil)
    @value = value
    @next = next_node
  end
end

class LinkedList
  def initialize
    @head = nil
  end

  def add(value)
    if @head.nil?
      return @head = Node.new(value)
    end

    current = @head

    until current.next.nil?
      current = current.next
    end

    new_node = Node.new(value)
    current.next = new_node
  end

  def find_kth(k)
    current = @head
    runner = @head

    k.times do
      runner = runner.next
    end

    until runner.next.nil?
      current = current.next
      runner = runner.next
    end

    return current.value
  end
end

ll1 = LinkedList.new
ll1.add(1)
ll1.add(2)
ll1.add(3)
ll1.add(4)
ll1.add(5)
ll1.add(6)
# 1, 2, 3, 4, 5, 6

puts ll1.find_kth(3) == 3 
puts ll1.find_kth(5) == 1
