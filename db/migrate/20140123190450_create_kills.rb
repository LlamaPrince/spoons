class CreateKills < ActiveRecord::Migration
  def change
    create_table :kills do |t|
      t.integer :target_id
      t.integer :killer_id
      t.boolean :granted
      t.date :date

      t.timestamps
    end
  end
end
