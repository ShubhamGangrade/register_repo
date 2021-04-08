class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.integer :phone
      t.string :address
      t.string :school
      t.integer :school_percentage
      t.string :graduation
      t.integer :graduation_percentage
      t.user_id :string
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
