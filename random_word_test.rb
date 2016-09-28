require 'optparse'
require 'rantly'
require_relative './lib/bloom_filter'
require_relative './lib/hash_function/djb2'
require_relative './lib/hash_function/djb2a'

options = {
  bitmap_size: 100_000_000,
  random_word_count: 10_000
}

OptionParser.new do |op|
  op.on('-s SIZE', '--bitmap-size=SIZE', Integer) do |n|
    options[:bitmap_size] = n
  end

  op.on('-r COUNT', '--random-word-count=COUNT', Integer) do |n|
    options[:random_word_count] = n
  end
end.parse!

hash_functions = [HashFunction::Djb2, HashFunction::Djb2a]
filter = BloomFilter.new(hash_functions, options[:bitmap_size])

STDIN.each do |line|
  filter.add(line.chomp)
end

positives = Rantly.map(options[:random_word_count]) { string }.select { |item|
  filter.include?(item)
}

puts 'Positives:'
puts positives.join(' ')

puts "#{positives.count} out of #{options[:random_word_count]} random words"
