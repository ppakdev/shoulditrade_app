class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.boolean :vote
      t.references :trade
      t.timestamps
    end
  end
end
