class AddParentIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :parent, foreign_key: { to_table: :users }
  end
end
