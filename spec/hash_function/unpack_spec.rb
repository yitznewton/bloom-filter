require 'spec_helper'
require 'shared_examples/hash_function'
require 'hash_function/unpack'

describe HashFunction::Unpack do
  subject { described_class }

  let(:bitmap_size) { 10000 }
  let(:property_test_runs) { 10000 }

  it_behaves_like 'a hash function'
end
