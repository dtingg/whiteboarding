# Detect a loop in a linked list

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

    return current
  end

  def has_cycle
    return false if @head.nil? || @head.next.nil?

    slow = @head
    fast = @head

    while fast
      slow = slow.next
      fast = fast.next

      if fast
        fast = fast.next

        if fast == slow
          return true
        end
      end
    end
    return false
  end
end

ll1 = LinkedList.new
ll1.add(1)
ll1.add(2)
ll1.add(3)

four = Node.new(4)
five = Node.new(5)
six = Node.new(6)

three = ll1.find_kth(1)
three.next = four
four.next = five
five.next = six
six.next = four

puts ll1.has_cycle == true
