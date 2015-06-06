class OrdersController < ApplicationController
    
    before_action :initialize_cart #可以提出去 放到application controller裡面
    
    def  create
      
        @order = Order.new(order_params)
       #寫入訂單
        @cart.items.each do |item|
         order_item = {product: item.product, quantity: item.quantity}
         @order.order_items.build(order_item)
        end
       
       if @order.save     
        #刷卡
         Braintree::Transaction.sale(
               :amount => @cart.total_price,
               :payment_method_nonce => "nonce-from-the-client"
                )
       
        flash[:notice] = "成功"
      
       #清除購物車
        session[:cart] = nil 
       #轉回首頁
        redirect_to products_path, notice:'感謝您的購買!'
        
       else
         render 'carts/checkout'
       end
    end
    
    
    private
    def order_params
     params.require(:order).permit(:recipient, :address, :tel, :email, :will_receive_edm)
    end
    
    
end
