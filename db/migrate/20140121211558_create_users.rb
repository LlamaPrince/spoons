class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :hall_id
      t.string :gender
      t.string :status
      t.integer :target_id

      t.timestamps
    end
  end
end
