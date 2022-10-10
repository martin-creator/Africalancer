class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @subscription = Subscription.find_by_user_id(current_user.id)

    if @subscription.present?
      @plan = Stripe::Plan.retrieve(@subscription.plan_id)
    end
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
    path_access_token = "https://graph.accountkit.com/'.$version.'/access_token?" +
                        "grant_type=authorization_code" +
                        "&code=#{params[:code]}" +
                        "&access_token=AA|#{app_id}|#{secret}"

    response = Net::HTTP.get(URI.parse(path_access_token))
    response = JSON.parse(response)

    #https://verify.twilio.com/v2/Services/VA2ab2d55df9fb58a7c0e61c41f182928d/Verifications
    if response["access_token"]
      path_get_data = "https://graph.accountkit.com/v1.1/me?access_token=#{response["access_token"]}"
      response = Net::HTTP.get(URI.parse(path_access_token))
      response = JSON.parse(response)

      if response["phone"]["number"]
        current_user.update(phone: response["phone"]["number"])
        return render json: { success: true }
      end
    end
    return render json: { success: false }
  end

  def update_payment
    if !current_user.stripe_id
      customer = Stripe::Customer.create(
        email: current_user.email,
        source: params[:stripeToken],
      )
    else
      customer = Stripe::Customer.update(
        current_user.stripe_id,
        source: params[:stripeToken],
      )
    end

    Rails.logger.debug("My object: #{customer.inspect}")

    if current_user.update(stripe_id: customer.id, stripe_last_4: Stripe::Customer.retrieve_source(customer.id, customer.default_source)["last4"])
      flash[:notice] = "New Card is saved"
    else
      flash[:alert] = "Invalid card"
    end

    redirect_to request.referrer
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to request.referrer
  end

  def update_payout
    if current_user.update(paypal: params[:paypal])
      flash[:notice] = "Updated payout successfully"
    else
      flash[:notice] = "Something went wrong while updating payout"
    end
    redirect_to request.referrer
  end

  def earnings
    @net_income = (Transaction.where("seller_id = ?", current_user.id).sum(:amount) / 1.1).round(2)

    @withdrawn = Transaction.where("buyer_id = ? AND status = ? AND transaction_type = ?",
                                   current_user.id,
                                   Transaction.statuses[:approved],
                                   Transaction.transaction_types[:withdraw]).sum(:amount)

    @pending = Transaction.where("buyer_id = ? AND status = ? AND transaction_type = ?",
                                 current_user.id,
                                 Transaction.statuses[:pending],
                                 Transaction.transaction_types[:withdraw]).sum(:amount)

    @purchased = Transaction.where("buyer_id = ? AND source_type = ? AND transaction_type = ?",
                                   current_user.id,
                                   Transaction.source_types[:system],
                                   Transaction.transaction_types[:trans]).sum(:amount)

    @withdrawable = @current_user.wallet

    @transactions = Transaction.where("seller_id = ? OR (buyer_id = ? AND source_type = ?)",
                                      current_user.id,
                                      current_user.id,
                                      Transaction.source_types[:system]).page(params[:page])
  end

  def withdraw
    amount = params[:amount].to_i 
    is_pending_withdraw = Transaction.exists?(buyer_id: current_user.id, 
                                              status: Transaction.statuses[:pending],
                                              transaction_type: Transaction.transaction_types[:withdraw] )

    if amount <= 0
      flash[:alert] = "Invalid amount"
    elsif amount > current_user.wallet
      flash[:alert] = "You are asking for more than you have"
    elsif !is_pending_withdraw.blank?
      flash[:alert] = "You currently have a pending withdraw request"
    else
      transaction = Transaction.new 
      transaction.status = Transaction.statuses[:pending]
      transaction.transaction_type = Transaction.transaction_types[:withdraw]
      transaction.source_type = Transaction.source_types[:system]
      transaction.buyer = current_user
      transaction.amount = amount

      if transaction.save 
        flash[:notice] = "Create withdraw request successfully"
      else  
        flash[:alert] = "Cannot create a request"
      end
    end
    redirect_to request.referrer
  end

  def remove_subscription
    @subscription = Subscription.find_by_user_id(current_user.id)

    if @subscription.present? && @subscription.sub_id
      Stripe::Subscription.delete(@subscription.sub_id)
      return redirect_to request.referrer, notice: " Your subscription is cancelled"
    end

    return redirect_to request.referrer, alert: " Cannot cancel subscription. Contact admin"
  end



  private

  def current_user_params
    params.require(:user).permit(:from, :about, :status, :language, :avatar)
  end
end
