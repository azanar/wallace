$:.push('lib')

require 'coveralls'
Coveralls.wear!

if ENV["ENABLE_SIMPLE_COV"]
  require 'simplecov'
  SimpleCov.start do
    add_filter "test"
  end
end

require 'active_support/time'
require 'test/unit/testcase'
require 'mocha/setup'

