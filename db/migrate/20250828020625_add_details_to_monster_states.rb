class AddDetailsToMonsterStates < ActiveRecord::Migration[7.2]
  def change
    add_column :monster_states, :action_count, :integer
    add_column :monster_states, :action_pattern, :text
  end
end
