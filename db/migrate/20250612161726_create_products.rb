class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.references :category, null: false, foreign_key: true
      t.references :supplier, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
