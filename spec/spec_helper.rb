require 'yaml'
require 'rspec'
require 'rspec-puppet'
require 'puppetlabs_spec_helper/module_spec_helper'
require 'pry'

FIXTURES_PATH = File.expand_path(File.dirname(__FILE__) + '/fixtures')
# Set up our $LOAD_PATH to properly include custom provider code from modules
# in spec/fixtures
$LOAD_PATH.unshift(*Dir["#{FIXTURES_PATH}/modules/*/lib"])

RSpec.configure do |c|
  c.mock_with :rspec
  c.formatter = :documentation

  c.before(:each) do
    # Workaround until this is fixed:
    #   <https://tickets.puppetlabs.com/browse/PUP-1547>
    require 'puppet/confine/exists'
    Puppet::Confine::Exists.any_instance.stubs(:which => '')
  end
end
