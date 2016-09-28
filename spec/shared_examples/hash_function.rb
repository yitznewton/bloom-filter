shared_examples_for 'a hash function' do
  it 'is in expected range' do
    property_of {
      string
    }.check(property_test_runs) { |item|
      expect(0..bitmap_size).to cover(subject.call(item))
    }
  end

  it 'returns the same value for the same string' do
    property_of {
      string
    }.check(property_test_runs) { |item|
      expect(subject.call(item)).to eq(subject.call(item))
    }
  end

  it 'returns differing values', manual: true do
    # for most cases (some pairs legitimately hash the same)
    property_of {
      [string, string]
    }.check(property_test_runs) { |item_0, item_1|
      expect(subject.call(item_0)).not_to eq(subject.call(item_1))
    }
  end
end
