class SessionsController < ApplicationController
  def new
    # Renders login form
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id  # Store the user ID in the session
      redirect_to root_path  # Redirect to home page
    else
      flash[:alert] = "Invalid email or password"
      render 'new'  # Render the login form again
    end
  end

  def destroy
    session[:user_id] = nil  # Log out by clearing the session
    redirect_to login_path  # Redirect to login page
  end
end
