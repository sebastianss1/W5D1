class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    i = self[key]
    unless @store[i].include?(key.hash)
      @store[i] << key.hash
      @count += 1
    end
  end

  def include?(key)
    i = self[key]
    @store[i].include?(key.hash)
  end

  def remove(key)
  end

  private

  def [](num)
    num % num_buckets
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
