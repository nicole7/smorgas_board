class CreateGeeks < ActiveRecord::Migration[5.1]
  def change
    create_table :geeks do |t|
      t.string :name
      t.string :desc
      t.string :cat
      t.string :play_time
      t.string :year_pub
      t.string :img
      t.string :num_players

    end
  end
end
