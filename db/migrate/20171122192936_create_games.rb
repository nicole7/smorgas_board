class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :name
      t.string :description
      t.string :category
      t.string :player_num
      t.string :playing_time
      t.string :year_created
      t.string :image_url

      t.timestamps
    end
  end
end
