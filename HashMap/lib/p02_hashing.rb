require "byebug"

class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return nil.hash if self.empty?
    unique_hashed_els = self.map.with_index { |el,i| el.hash ^ i.hash }
    unique_hashed_els[1..-1].inject(unique_hashed_els[0].hash) do |acc, el|
      acc ^ el.hash
    end
  end
end

class String
  def hash
    alphabet = ("a".."z").to_a + ("A".."Z").to_a
    hash = {}

    alphabet.each_with_index do |char, i|
      hash[char] = -(i + 1).hash
    end 

    unique_hashed_chars = self.chars.map.with_index {|char, i| hash[char] ^ i.hash}
    unique_hashed_chars[1..-1].inject(unique_hashed_chars[0].hash) do |acc, el|
      acc ^ el.hash
    end
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    # break the keys and values into arrays
    # call our newly created string#hash and array#hash methods on them
    # debugger
    return nil.hash if self.empty?
    # keys = self.keys.map { |key| key.to_s }
    # values = self.values
    # pairs = keys + values

    hashed_pairs = []
    self.each do |key, val|
      hashed_pairs << key.hash ^ val.hash
    end

    hashed_pairs.hash

    # check if el is a string or integer
      # perform appropriate hashing on the type
  end
end

