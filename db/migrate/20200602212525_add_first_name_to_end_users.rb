class AddFirstNameToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :first_name, :string, index: true, null: false, default: ""
  end
end
