class AddDiscardedAtToLaboratories < ActiveRecord::Migration[5.2]
  def change
    add_column :laboratories, :discarded_at, :datetime
    add_index :laboratories, :discarded_at
  end
end
