class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.integer :width
      t.integer :height
      t.binary :gamedata

      t.timestamps
    end
  end
end
