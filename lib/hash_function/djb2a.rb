module HashFunction
  module Djb2a
    def self.call(item)
      hash = 5381

      item.each_byte do |b|
        hash = (((hash << 5) + hash) ^ b) % (2**32)
      end

      hash
    end
  end
end
