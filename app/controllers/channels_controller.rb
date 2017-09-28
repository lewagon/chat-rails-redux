class ChannelsController < ApplicationController
  def show
    if params[:id].blank?
      redirect_to channel_path(Channel.first)
    else
      @channel = Channel.find_by(id: params[:id]) || Channel.first
      @channels = Channel.all
    end
  end
end
