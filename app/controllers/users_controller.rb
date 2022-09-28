class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
  end

  def show
    @user = User.find(params[:id])
    @reviews = Review.where(seller_id: params[:id]).order("created_at desc")
  end

  def update
    @user = current_user
    if @user.update_attributes(current_user_params)
      flash[:notice] = "Saved..."
    else
      flash[:alert] = "Cannot update..."
    end
    redirect_to dashboard_path
  end

  def callback_phone
    path_access_token =  "https://graph.accountkit.com/'.$version.'/access_token?"+
                          "grant_type=authorization_code" +
                          "&code=#{params[:code]}"+
                          "&access_token=AA|#{app_id}|#{secret}"

    response = Net::HTTP.get(URI.parse(path_access_token))
    response = JSON.parse(response)


    #https://verify.twilio.com/v2/Services/VA2ab2d55df9fb58a7c0e61c41f182928d/Verifications
    if response['access_token']
      path_get_data = "https://graph.accountkit.com/v1.1/me?access_token=#{response['access_token']}"
      response = Net::HTTP.get(URI.parse(path_access_token))
      response = JSON.parse(response)

      if response['phone']['number']
        current_user.update(phone: response['phone']['number'] )
        return render json: {success: true}
      end
    end
    return render json: {success: false}

  end


  private
  def current_user_params
    params.require(:user).permit(:from, :about, :status, :language, :avatar )
  end
end
