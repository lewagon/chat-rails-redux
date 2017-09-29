class Api::V1::MessagesController < ApplicationController
  before_action :set_channel

  def index
    messages = @channel.messages.order('created_at ASC').map do |message|
      render_message(message)
    end
    render json: messages
  end

  def create
    message = @channel.messages.build(content: params[:content])
    message.user = current_user
    message.save
    render json: render_message(message)
  end

  private

  def set_channel
    @channel = Channel.find_by(name: params[:channel_id])
  end

  def render_message(message)
    {
      id: message.id,
      author: message.user.email,
      content: message.content,
      created_at: message.created_at
    }
  end
end
