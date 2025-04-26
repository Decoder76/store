class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end

class DashboardController < ApplicationController
  def index
    @current_user = Current.session&.user
    @products = Product.limit(5).order(created_at: :desc) # Fetch recent products
  end
end
