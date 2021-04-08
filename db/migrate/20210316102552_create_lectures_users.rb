class CreateLecturesUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :lectures_users, id: false do |t|
      t.references :lecture, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
