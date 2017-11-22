class CreateFriendings < ActiveRecord::Migration[5.1]
  def change
    create_table :friendings do |t|
      t.integer :user_id
      t.integer :friend_id

      t.timestamps
    end
    # add_index(:friendings, [:requester_id, :acceptor_id], :unique => true)
    # add_index(:friendings, [:acceptor_id, :requester_id], :unique => true)
  end
end
