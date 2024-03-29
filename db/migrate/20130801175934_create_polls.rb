class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :title
      t.text :description
      t.integer :author_id
      t.timestamps
    end

    add_index :polls, :author_id
  end
end
