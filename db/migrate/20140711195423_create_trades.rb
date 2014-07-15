class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.timestamps
      t.references :user
    end
  end
end
