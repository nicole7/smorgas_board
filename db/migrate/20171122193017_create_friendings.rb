class CreateFriendings < ActiveRecord::Migration[5.1]
  def change
    create_table :friendings, id: false do |t|
      t.integer :requester_id
      t.integer :acceptor_id

      t.timestamps
    end
    add_index(:friendings, [:requester_id, :acceptor_id], :unique => true)
    add_index(:friendings, [:acceptor_id, :requester_id], :unique => true)
  end
end
