class Post < ActiveRecord::Base
  belongs_to :user

  validates :description, :presence => true

  scope :today, ->(date) { where("date = ?",
   date) }

end
