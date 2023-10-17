class CreateMessageThreadMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :message_thread_messages do |t|
      t.references :message_thread, null: false, foreign_key: true
      t.references :message, null: false, foreign_key: true

      t.timestamps
    end
  end
end
