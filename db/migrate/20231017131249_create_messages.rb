class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.string :title
      t.text :content
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
