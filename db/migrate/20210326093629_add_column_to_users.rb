class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :active, :boolean, default: true
    add_column :profiles, :pet, :text, array: true, default: [].to_yaml
  end
end
