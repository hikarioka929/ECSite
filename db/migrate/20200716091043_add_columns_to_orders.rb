class AddColumnsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :end_user_id, :integer
    add_column :orders, :peyment, :integer
    add_column :orders, :post_code, :string
    add_column :orders, :address, :string
    add_column :orders, :name, :string
    add_column :orders, :postage, :integer
    add_column :orders, :total_price, :integer
    add_column :orders, :order_status, :integer
  end
end
