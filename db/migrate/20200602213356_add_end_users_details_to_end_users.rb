class AddEndUsersDetailsToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :kana_last_name, :string, null: false, index: true, default: ""
    add_column :end_users, :kana_first_name, :string, null: false, index: true, default: ""
    add_column :end_users, :post_code, :string, null: false, default: ""
    add_column :end_users, :address, :string, null: false, default: ""
    add_column :end_users, :phone_number, :string, null: false, default: ""
  end
end
