class CreateInvoices < ActiveRecord::Migration[8.0]
  def change
    create_table :invoices do |t|
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
