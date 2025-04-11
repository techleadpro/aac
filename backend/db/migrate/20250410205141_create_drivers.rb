class CreateDrivers < ActiveRecord::Migration[8.0]
  def change
    create_table :drivers do |t|
      t.string :full_name
      t.string :email
      t.string :phone
      t.string :truck_type
      t.text :truck_data

      t.timestamps
    end
  end
end
