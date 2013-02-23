require 'rubygems'
require 'spork'
require 'spork/ext/ruby-debug'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.use_transactional_fixtures = true
    config.infer_base_class_for_anonymous_controllers = false
    config.run_all_when_everything_filtered = true
    config.include FactoryGirl::Syntax::Methods
    config.include Devise::TestHelpers, :type => :controller
  end

  require 'database_cleaner'
  DatabaseCleaner.strategy = :truncation
end

Spork.each_run do
  DatabaseCleaner.clean
  FactoryGirl.reload
  require File.expand_path("../../config/routes", __FILE__)
  
  # Require lib files
  Dir[File.join(File.dirname(__FILE__), '..', 'lib', '*.rb')].each do |file|
    require file
  end

  # Require helps
  Dir[File.join(File.dirname(__FILE__), '..', 'app', 'helpers', '*.rb')].each do |file|
    require file
  end

  ActiveSupport::Dependencies.clear
end
