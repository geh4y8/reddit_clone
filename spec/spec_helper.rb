require 'rspec'
require 'active_record'
require 'user'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    User.all.each { |user| user.destroy }
  end
end
