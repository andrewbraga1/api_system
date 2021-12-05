class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.string :name
      t.string :typo
      t.boolean :status, default:false

      t.timestamps
    end
  end
end
