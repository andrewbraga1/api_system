class CreateLaboratories < ActiveRecord::Migration[5.2]
  def change
    create_table :laboratories do |t|
      t.string :name
      t.string :address
      t.boolean :status, default:false

      t.timestamps
    end
  end
end
