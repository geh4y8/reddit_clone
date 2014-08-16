class AddDatetime < ActiveRecord::Migration
  def change
    remove_column :posts, :created_at, :datetime
    remove_column :posts, :updated_at, :datetime
    add_column :posts, :date, :date
  end
end
