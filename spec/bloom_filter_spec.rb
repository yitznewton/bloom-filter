require 'spec_helper'
require 'bloom_filter'
require 'hash_function/djb2'
require 'hash_function/djb2a'

describe BloomFilter do
  subject { described_class.new(hash_functions, bitmap_size) }

  let(:hash_functions) {
    [
      HashFunction::Djb2,
      HashFunction::Djb2a
    ]
  }

  let(:bitmap_size) { 10000 }
  let(:property_test_runs) { 10000 }

  context 'with an empty filter' do
    it 'does not recognize any item as included' do
      property_of {
        string
      }.check(property_test_runs) { |item|
        expect(subject).not_to include(item.dup)
      }
    end
  end
end
