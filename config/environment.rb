# Load the rails application
require File.expand_path('../application', __FILE__)

ENV['RAILS_ENV'] ||= 'production'
# Initialize the rails application
ChiachiaStore::Application.initialize!

ActiveRecord::Base.include_root_in_json = false
