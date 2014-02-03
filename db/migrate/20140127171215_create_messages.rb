class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.string :text
      t.integer :target_id
      t.string :target_type

      t.timestamps
    end
  end
end
