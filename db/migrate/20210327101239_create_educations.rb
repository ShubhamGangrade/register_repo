class CreateEducations < ActiveRecord::Migration[6.1]
  def change
    create_table :educations do |t|
      t.string :qualification
      t.integer :percentage
      t.string :board
      t.integer :year
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
