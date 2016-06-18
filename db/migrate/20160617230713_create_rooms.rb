class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms, id: :uuid do |t|
      t.string :type_r
      t.integer :quantity
      t.decimal :price, :precision => 5, :scale => 2 , :default => 0
      t.belongs_to :hotel, type: :uuid, null: false, index: true
      t.timestamps null: false
    end
  end
end
