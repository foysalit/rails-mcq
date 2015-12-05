class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.references :exam, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
