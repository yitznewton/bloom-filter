require 'bitarray'

class BloomFilter
  def initialize(hash_functions, bitmap_size)
    @hash_functions = hash_functions
    @bitmap_size = bitmap_size
    @bitmap = BitArray.new(bitmap_size)
  end

  def add(item)
    hash_functions.each do |hf|
      bitmap[hf.call(item) % bitmap_size] = 1
    end
  end

  def include?(item)
    hash_functions.each do |hf|
      return true if bitmap[hf.call(item) % bitmap_size] == 1
    end

    false
  end

  private

  attr_reader :hash_functions, :bitmap_size, :bitmap
end
