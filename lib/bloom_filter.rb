require 'bitarray'

class BloomFilter
  def initialize(hash_functions, bitmap_size)
    @hash_functions = hash_functions
    @bitmap_size = bitmap_size
    @bitmap = BitArray.new(bitmap_size)
  end

  def include?(_)
    false
  end

  private

  attr_reader :hash_functions, :bitmap_size, :bitmap
end
