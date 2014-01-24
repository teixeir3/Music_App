class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :band_id, null: false
      t.string :title, null: false
      t.date :year, null: false
      t.boolean :live, null: false

      t.timestamps
    end

    add_index :albums, [:band_id, :title], :uniqueness => true
  end
end
