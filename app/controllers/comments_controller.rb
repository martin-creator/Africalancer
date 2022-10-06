class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :is_valid_order

    def create
        order = Order.find(comment_params[:order_id])

        if comment_params[:content].blank?
            return redirect_to request.referrer, alert: "Invalid Message"
        end

        @comment =  Comment.new(
            user_id: current_user.id,
            order_id: order.id,
            content: comment_params[:content]
        )

        if @comment.save
            redirect_to request.referrer, notice: "Comment sent..."
        else  
            redirect_to request.referrer, alert: "Comment could not be sent..."
        end
    end



    private
    def comment_params
        params.require(:comment).permit(:content, :order_id)
    end

    def is_valid_order
        redirect_to dashboard_path, alert: "Invalid order" unless Order.find(comment_params[:order_id]).present?
    end
end