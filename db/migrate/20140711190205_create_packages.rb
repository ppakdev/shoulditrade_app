class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.date :posted
      t.references :trade
    end
  end
end
