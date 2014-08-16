class User < ActiveRecord::Base
  has_many :posts

  before_save :upcase_name

  validates :name, :presence => true
  validates :password, :presence => true, :length => { :minimum => 8 }
  validates :name, :uniqueness => true

private

  def upcase_name
    self.name = self.name.upcase
  end
end
