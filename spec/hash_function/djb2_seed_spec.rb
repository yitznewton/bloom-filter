require 'spec_helper'
require 'hash_function/djb2_seed'

describe HashFunction::Djb2Seed do
  subject { described_class.new(bitmap_size) }

  let(:bitmap_size) { 100 }

  it 'is always in expected range' do
    property_of {
      string
    }.check { |item|
      expect(0..bitmap_size).to cover(subject.call(item))
    }
  end
end
