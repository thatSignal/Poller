class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :responder_id
      t.integer :choice_id
      t.timestamps
    end

    add_index :responses, :responder_id
    add_index :responses, :choice_id
  end
end
