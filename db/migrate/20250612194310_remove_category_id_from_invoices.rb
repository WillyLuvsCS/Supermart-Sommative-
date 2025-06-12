class RemoveCategoryIdFromInvoices < ActiveRecord::Migration[7.0]
  def change
    remove_column :invoices, :category_id, :integer
  end
end
