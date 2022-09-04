class ApplicationController < ActionController::Base
   include ApplicationHelper
   before_action :set_render_cart
   before_action :initialize_cart
   before_action :set_current_user
   before_action :protect_pages

def set_render_cart
  @render_cart = true
end

def initialize_cart
  @cart ||= Cart.find_by(id: session[:cart_id])

  if @cart.nil?
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end
def set_current_user
  Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
end

def protect_pages
  redirect_to new_session_path, alert: t('common.not_logged_in') unless Current.user
end
end
