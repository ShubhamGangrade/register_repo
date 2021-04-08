class RemoveColumnFromProfile < ActiveRecord::Migration[6.1]
  def change
    remove_column :profiles, :school, :string
    remove_column :profiles, :school_percentage, :integer
    remove_column :profiles, :graduation, :string
    remove_column :profiles, :graduation_percentage, :integer
  end
end
