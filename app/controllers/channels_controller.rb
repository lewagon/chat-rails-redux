class ChannelsController < ApplicationController
  def show
    @channels = Channel.all
    @channel = Channel.find(params[:id])
  end
end
