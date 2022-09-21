class RequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_request, except: [:new, :create, :index, :list]
  before_action :is_authorized, only: [:edit, :update, :destroy]
  before_action :set_categories, only: [:new, :edit, :list]

  def index
  end

  def new
    @request = current_user.requests.build
  end

  def create
    @request = current_user.requests.build(request_params)
    
    if @request.save
      redirect_to requests_path, notice: "Saved..."
    else 
      redirect_to request.referrer, flash: {error: @request.errors.full_messages.join(', ')}
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  def list
  end

  private

  def set_categories
    @categories = Category.all
  end

  def set_request
    @request = Request.find(params[:id])
  end

  def is_authorized
    redirect_to root_path, alert: "You don't have permission" unless current_user.id == @request.user.id
  end

  def request_params
    params.require(:request).permit(:description, :category_id, :delivery, :budget, :attachment_file, :title )
  end
end
