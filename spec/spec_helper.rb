require 'rspec'
require 'active_record'
require 'user'
require 'post'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    User.all.each { |user| user.destroy }
    Post.all.each { |post| post.destroy }
  end
end
