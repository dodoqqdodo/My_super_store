class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  
    private
    def initialize_cart
        @cart = Cart.build_from_hash(session[:cart])
    end
end
