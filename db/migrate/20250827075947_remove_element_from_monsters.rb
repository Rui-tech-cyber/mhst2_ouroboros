class RemoveElementFromMonsters < ActiveRecord::Migration[7.2]
  def change
    remove_column :monsters, :element, :integer
  end
end
