class GigsController < ApplicationController

  before_action :authenticate_user!, except: [:show]
  before_action :set_gig, except: [:new, :create]
  before_action :is_authorized, only: [:edit, :update]


  def new
    @gig = current_user.gigs.build
    @categories = Category.all
  end

  def create
    @gig = current_user.gigs.build(gig_params)

    if @gig.save
      @gig.pricings.create(Pricing.pricing_types.values.map{ |x| {pricing_type: x}})
      redirect_to edit_gig_path(@gig), notice: "Saved..."
    else
      redirect_to request.referrer, flash: {error: @gig.errors.full_messages }
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def set_gig
    @gig = Gig.find(params[:id])
  end

  def is_authorized
    redirect_to root_path, alert: "You do not have permission" unless current_user.id == @gig.user_id
  end

  private

  def gig_params
    params.require(:gig).permit(:title, :video, :active, :category_id, :has_single_pricing, 
           pricings_attributes: [:id, :title, :description, :delivery_time, :price, :pricing_type ] )
  end

end
