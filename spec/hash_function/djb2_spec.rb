require 'spec_helper'
require 'hash_function/djb2'

describe HashFunction::Djb2 do
  subject { described_class.new(bitmap_size) }

  let(:bitmap_size) { 100000 }
  let(:property_test_runs) { 10000 }

  it 'is in expected range' do
    property_of {
      string
    }.check(property_test_runs) { |item|
      expect(0..bitmap_size).to cover(subject.call(item))
    }
  end

  it 'returns differing values' do
    property_of {
      [string, string]
    }.check(property_test_runs) { |item_0, item_1|
      expect(subject.call(item_0)).not_to eq(subject.call(item_1))
    }
  end
end
