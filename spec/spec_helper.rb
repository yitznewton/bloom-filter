require 'rantly/rspec_extensions'

RSpec.configure do |c|
  c.filter_run_excluding manual: true
end
