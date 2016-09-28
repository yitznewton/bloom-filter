## Bloom filter in Ruby

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
