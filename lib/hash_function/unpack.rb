module HashFunction
  module Unpack
    def self.call(item)
      item.unpack('B*')[0].to_i(2)
    end
  end
end
