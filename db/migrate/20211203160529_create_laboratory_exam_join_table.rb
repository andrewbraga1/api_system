class CreateLaboratoryExamJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :laboratory_exams do |t|
      t.belongs_to :laboratory, foreign_key: true
      t.belongs_to :exam, foreign_key: true
      t.timestamps
    end
  end
end
