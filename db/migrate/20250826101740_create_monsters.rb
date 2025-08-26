class CreateMonsters < ActiveRecord::Migration[7.2]
  def change
    create_table :monsters do |t|
      t.string :name
      t.string :kana
      t.integer :element
      t.string :image_url

      t.timestamps
    end
  end
end
