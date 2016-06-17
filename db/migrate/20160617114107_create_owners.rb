class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners, id: :uuid do |t|

      t.timestamps null: false
    end
  end
end
