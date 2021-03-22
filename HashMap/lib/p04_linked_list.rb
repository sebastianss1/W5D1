# require "enumerable"

class Node

  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head 
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    self[0]
  end

  def last
    self[-1]
  end

  def empty?
    return true if @head.next == @tail
    false
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    node = Node.new(key,val)
    
    end_node = @tail.prev
    
    node.next = @tail
    @tail.prev = node

    end_node.next = node
    node.prev = end_node
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each(&blc)
    node = @head.next
    until node == @tail
      blc.call(node)
      node = node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
