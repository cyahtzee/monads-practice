class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.text :line_one
      t.text :line_two

      t.timestamps
    end
  end
end
