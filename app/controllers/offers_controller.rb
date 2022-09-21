class OffersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_offer, only: 
    before_action :is_authorized, only: [:accept, :reject]
    def create
        
    end

    def accept
        
    end

    def reject
        
    end

    private

    def  set_offer
        @offer = Offer.find(params[:id])
    end

    def is_authorized
        redirect_to root_path, alert: "You don't have permission" unless current_user.id == @offer.request.user.id
    end

    def offer_params
        params.require(:offer).permit(:amount, :days, :note, :request_id, :status)
    end
end