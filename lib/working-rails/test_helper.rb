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

# If these are run before the fork, then they will very likely trigger a
# pre-fork load of the code that you end up wanting to test. Instead, we do it
# only on each_run
Spork.each_run do
  class ActiveSupport::TestCase
    fixtures :all
  end
end
