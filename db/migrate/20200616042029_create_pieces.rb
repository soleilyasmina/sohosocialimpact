class CreatePieces < ActiveRecord::Migration[6.0]
  def change
    create_table :pieces do |t|
      t.string :name
      t.string :description
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
