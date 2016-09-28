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

  context 'with a non-empty filter' do
    it 'always recognizes members as included' do
      property_of {
        string
      }.check(property_test_runs) { |item|
        subject.add(item)
        expect(subject).to include(item.dup)
      }
    end

    it 'recognizes some non-members as not included' do
      pass = false

      subject.add('hello')

      Rantly.map(property_test_runs) { string }.each do |item|
        pass = true if !subject.include?(item)
      end

      fail unless pass
    end
  end

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
