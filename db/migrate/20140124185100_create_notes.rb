class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :text, null: false
      t.integer :user_id, null: false
      t.integer :track_id, null: false

      t.timestamps
    end

    add_index :notes, [:user_id, :track_id]
  end
end
