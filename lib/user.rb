class User < ActiveRecord::Base
  has_many :posts

  validates :name, :presence => true
  validates :password, :presence => true, :length => { :minimum => 8 }
  validates :name, :uniqueness => true
end
