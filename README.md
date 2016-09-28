## Bloom Filter in Ruby

### Assumptions

* Members of the filter are `String` instances

### Installation

1. Install Ruby 2.2 or 2.3 on your machine (beyond the scope of this README)
1. Use Bundler to install the gem dependencies, e.g. `bundle install`

### Basic operation

You can test the false-positive rate against a dictionary by piping the
dictionary into `STDIN`:

```shell
$ ruby random_word_test.rb --bitmap-size=100_000_000 --random-word-count=10_000 < /usr/share/dict/words
```

The test script currently uses the DJB2 and DJB2A hash algorithms.

### Hash functions

Any lambda-like which accepts a `String` and returns an `Integer` can
serve as a hash function:

```ruby
item = 'hello world'
hash_function.call(item)
# > 1234
```

Several well-known hash algorithms have been provided as modules.

### Running the test suite

Travis runs automated tests and Rubocop style checking, which you can do
locally via:

```shell
$ bundle exec rspec && bundle exec rubocop
```

There are some tests which sometimes "fail" expectedly in a minority of
cases due to the nature of the system under test; they can be run via:

```shell
$ bundle exec rspec -t manual
```

### Design overview

I've implemented the specific hash functions as callable modules for ease
of naming and requiring them; it would be just as valid to use lambdas,
or objects in case configuration be required.

For my default hash functions, I searched around for simple effective
hashing functions, and implemented the DJB2 algorithms. I also included
a simple function using Ruby's `String#unpack` and converting the binary
result into an `Integer`. I'm not sure of the greater implications of using
that algorithm.

Given the nature of the kata, it seemed an ideal opportunity to try out
property-based testing. I've read about it before, but this is my first
time using the technique.

I was able to use the TDD cycle while specifying general behavior. The
testing libraries I chose (RSpec and Rantly) do not appear to support the
ambiguity of the Bloom Filter's false positive policy, and so I had to
exclude those tests from the automated build until I can figure out how
to accomodate them.

I wrote a test script to play around with different sizes of bitmap as in
"Part two" of the kata. With a bitmap of 100M (3 orders of magnitude larger
than my computer's dictionary), I was able to get a false-positive rate of
under 1%. It was not a linear relationship; with 1M capacity, the rate was
roughly 15%.

False-positive rate was adversely affected when I added a third hash
function.

### TODO

* Revise the "manual" tests so that their inherent uncertainty is accounted
for, and they can be included in the build verification

### License

GPL-3.0
