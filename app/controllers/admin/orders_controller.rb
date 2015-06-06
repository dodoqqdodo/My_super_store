class Admin::OrdersController < Admin::BaseController #原本是ApplicationController
    
    #layout 'admin'
    #before_action :authenticate_user!  #改繼承自BASECONTROLLER
    
    
    def index
        @orders = Order.all
    end
    
end
