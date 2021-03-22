# require "enumerable"
require "byebug"

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
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    return true if @head.next == @tail
    false
  end

  def get(key)
    self.each { |link| return link.val if link.key == key }
  end

  def include?(key)
    self.each { |link| return true if link.key == key }
    false
  end

  def append(key, val)
    node = Node.new(key,val)
    
    end_node = @tail.prev
    
    node.next, @tail.prev = @tail, node # <= detaches tail with new node

    end_node.next, node.prev = node, end_node # <= attaches new node+tail back to chain
  end

  def update(key, val)
    self.each { |link| link.val = val if link.key == key }
  end

  def remove(key)
    self.each do |link|
      if link.key == key
        prev_node = link.prev
        next_node = link.next
        prev_node.next, next_node.prev = next_node, prev_node
      end
    end
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
