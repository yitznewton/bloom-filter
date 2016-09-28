## Bloom filter in Ruby

### Assumptions

* Members of the filter are `String` instances

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

### TODO

* Revise the "manual" tests so that their inherent uncertainty is accounted
for, and they can be included in the build verification

### License

GPL-3.0
