class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.column :description, :string
      t.column :user_id, :integer
      t.timestamps
    end
  end
end
