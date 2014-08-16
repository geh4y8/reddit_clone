class Post < ActiveRecord::Base
  belongs_to :user

  validates :description, :presence => true

  scope :today, lambda { where("date >= ? and date <= ?",
   Date.today.beginning_of_day, Date.today.end_of_day) }

end
