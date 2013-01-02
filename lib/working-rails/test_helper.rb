require 'working/test_helper'

ENV['RAILS_ENV'] = 'test'
require './config/environment'
require 'rails/test_help'

# For some reason using pry as `rails c` needs this specially defined:
unless respond_to? :reload!
  def reload!
    puts "[Performing .reload!]"
    ActionDispatch::Reloader.cleanup!
    ActionDispatch::Reloader.prepare!
  end
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

