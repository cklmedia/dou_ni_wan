class CreateFirends < ActiveRecord::Migration
  def change
    create_table :firends do |t|
      t.integer :group_id
      t.integer :own_id
      t.integer :user_id

      t.timestamps
    end
  end
end
