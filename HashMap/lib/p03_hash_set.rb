require "byebug"

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize!(@store) if @count == num_buckets
    i = self[key.hash]
    unless @store[i].include?(key.hash)
      @store[i] << key.hash
      @count += 1
    end
  end

  def include?(key)
    i = self[key.hash]
    @store[i].include?(key.hash)
  end

  def remove(key)
    i = self[key.hash]
    if @store[i].include?(key.hash)
      @store[i].delete(key.hash)
      @count -= 1
    end
  end

  private

  def [](num)
    num % num_buckets
  end

  def num_buckets
    @store.length
  end

  def resize!(buckets)
    @store = Array.new(num_buckets * 2) { Array.new }
    buckets.each do |bucket| 
      bucket.each do |value| 
        i = self[value]
        @store[i] << value
      end 
    end
  end
end
