module HashFunction
  class Djb2
    def initialize(bitmap_size)
      @bitmap_size = bitmap_size
    end

    def call(item)
      hash = 5381

      item.each_byte do |b|
        hash = (((hash << 5) + hash) + b) % (2 ** 32)
      end

      hash % @bitmap_size
    end
  end
end
