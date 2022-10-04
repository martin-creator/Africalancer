class ConversationsController < ApplicationController
    before_action :get_conversations
    def list
        
    end

    def show
        
    end


    private
    def get_conversations
        @conversations = Conversation
        .where("sender_id = ?  OR receiver_id = ?", current_user.id, current_user.id)
        .order(updated_at: :desc)
    end
end