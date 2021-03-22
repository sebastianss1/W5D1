require "byebug"

class MaxIntSet

  attr_reader :store

  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    @store[num] = true 
  end

  def remove(num)
    validate!(num)
    @store[num] = false
  end

  def include?(num)
    validate!(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num.between?(0, @max)
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    i = num % num_buckets
    @store[i] << num unless include?(num)
  end

  def remove(num)
    i = num % num_buckets
    @store[i].delete(num)
  end

  def include?(num)
    i = num % num_buckets
    @store[i].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize!(@store)
    i = num % num_buckets
    unless include?(num)
      @store[i] << num
      @count += 1
    end
    # debugger
  end

  def remove(num)
    i = num % num_buckets
    if include?(num)
      @store[i].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    i = num % num_buckets
    @store[i].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!(buckets)
    # debugger
    if @count == num_buckets
      @store = Array.new(num_buckets * 2) { Array.new }

      buckets.each do |bucket| 
        bucket.each do |value| 
          i = value % num_buckets 
          @store[i] << value
        end 
      end 
    end
    # reinsert the values from the buckets passed in
    # until i >= num_buckets
      # use #insert to place all the values
  end
end


