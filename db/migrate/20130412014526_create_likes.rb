class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
  		t.belongs_to :user
  		t.integer :crush
      t.timestamps
    end
  end
end
