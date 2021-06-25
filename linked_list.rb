# frozen_string_literal: true

# represents the full list
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    node = Node.new(value)
    if @tail
      new_tail = node
      @tail.next_node = new_tail
      @tail = new_tail
    else
      @head = @tail = node
    end
  end

  def prepend(value)
    node = Node.new(value)
    if @head
      new_head = node
      new_head.next_node = @head
      @head = new_head
    else
      @head = @tail = node
    end
  end

  def size
    count = 0
    node = @head
    until node.nil?
      count += 1
      node = node.next_node
    end
    count
  end

  def at(index)
    if index > size - 1
      nil
    else
      node = @head
      index.times do
        node = node.next_node
      end
    end
    node.value
  end

  def pop
    if size < 1
      nil
    else
      node = @head
      node = node.next_node until node.next_node == @tail
      node.next_node = nil
      @tail = node
    end
  end

  def contains?(value)
    node = @head
    until node.nil?
      return true if node.value == value

      node = node.next_node

    end
    false
  end

  def find(value)
    index = 0
    node = @head
    until node.nil?
      return index if node.value == value

      index += 1
      node = node.next_node
    end
    nil
  end

  def to_s
    node = @head
    until node.nil?
      p "( #{node.value} ) -> "
      node = node.next_node
    end
  end
end

# contains data and pointer
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new
list.append(25)
list.append(26)
list.prepend(24)
p list.to_s
