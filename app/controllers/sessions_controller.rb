class SessionsController < ApplicationController
  def new
  end

  def create
    # find a user by email in the input field and assign to variable user
    user = User.find_by(email: params[:email])
    # if user exists and can be authenticated with password typed in
    if user && user.authenticate(params[:password])
      # creating key-value pair
      session[:user_id] = user.id
      redirect_to products_url, notice: "Logged in!"
    else
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to products_url, notice: "Logged out!"
  end
end
