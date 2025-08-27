class CreateSearchHistories < ActiveRecord::Migration[7.2]
  def change
    create_table :search_histories do |t|
      t.string :keyword
      t.timestamps
    end
  end
end
