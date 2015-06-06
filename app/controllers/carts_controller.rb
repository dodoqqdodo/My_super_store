class CartsController < ApplicationController

    before_action :initialize_cart
    
    def show
    end
    
    def checkout
        @order=Order.new
        @token=Braintree::ClientToken.generate
    end
    
  
    def add
      product = Product.find_by(id: params[:id]) 
      if product
         # add to car    
           @cart.add_item(product.id)
            session[:cart]= @cart.serialize
           flash[:notice]= "商品 #{product.name} 已加入購物車"
      else
       flash[:notice] = '無此商品'
 
      end
     
      redirect_to :back
    end
  
    #private
   # def initialize_cart
   #     @cart = Cart.build_from_hash(session[:cart])
  #  end  抽到application_controller
  
    
end
