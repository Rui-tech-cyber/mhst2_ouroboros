class CreateMonsterStates < ActiveRecord::Migration[7.2]
  def change
    create_table :monster_states do |t|
      t.references :monster, null: false, foreign_key: true
      t.string :state_name
      t.integer :element

      t.timestamps
    end
  end
end
