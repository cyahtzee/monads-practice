class MessageThreadMessage < ApplicationRecord
  belongs_to :message_thread
  belongs_to :message
end
