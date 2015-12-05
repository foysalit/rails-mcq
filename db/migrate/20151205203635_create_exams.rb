class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :title
      t.boolean :expired

      t.timestamps null: false
    end
    add_index :exams, :title
  end
end
