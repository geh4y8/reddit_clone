class AddDatetime2 < ActiveRecord::Migration
  def change
    remove_column :posts, :date, :date
    add_column :posts, :date, :datetime
  end
end
