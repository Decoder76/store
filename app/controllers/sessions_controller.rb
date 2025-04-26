class SessionsController < ApplicationController
  include Authentication
  allow_unauthenticated_access only: %i[ new create ]
  # rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
    # Render the login form
  end

  def create
    user = User.find_by(email_address: params[:email]) # or just `email` if alias is used
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully."
    else
      flash.now[:alert] = "Invalid email or password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Logged out successfully."
  end
end
