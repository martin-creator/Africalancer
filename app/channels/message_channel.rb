class MessageChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    conversation =  Conversation.find params[:conversation]
    stream_for conversation
  end

end
