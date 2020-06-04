class AddLastNameToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :last_name, :string, index: true, null: false, default: ""
  end
end
