shared_examples_for 'a hash function' do
  it 'returns the same value for the same string' do
    property_of {
      string
    }.check(property_test_runs) { |item|
      expect(subject.call(item)).to eq(subject.call(item))
    }
  end

  it 'returns differing values', manual: true do
    # for most cases (some pairs legitimately hash the same)
    # TODO: find a way to allow for a margin of error
    property_of {
      [string, string]
    }.check(property_test_runs) { |item0, item1|
      expect(subject.call(item0)).not_to eq(subject.call(item1))
    }
  end
end
