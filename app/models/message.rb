class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  validates :content, presence: true

  after_create :broadcast_message

  def as_json(options = {})
    {
      id: id,
      author: user.email,
      content: content,
      created_at: created_at,
      channel: channel.name
    }
  end

  private

  def broadcast_message
    ActionCable.server.broadcast("channel_#{channel.name}", self)
  end
end
