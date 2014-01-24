class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.string :title, null: false
      t.boolean :live, null: false
      t.string :lyrics
      t.integer :ord

      t.timestamps
    end

    add_index :tracks, [:album_id, :title], uniqueness: true
  end
end
