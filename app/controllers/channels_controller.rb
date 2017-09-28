class ChannelsController < ApplicationController
  def show
    @channel = Channel.find_by(id: params[:id]) || Channel.first
    @channels = Channel.all
  end
end
