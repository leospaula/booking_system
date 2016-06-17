class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels, id: :uuid do |t|
      t.string :name
      t.string :description
      t.belongs_to :owner, type: :uuid, null: false, index: true
      t.timestamps null: false
    end
  end
end
