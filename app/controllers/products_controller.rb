class ProductsController < ApplicationController
    
    def index
        #@products = Product.where(is_online: true) #這邊不需要.all因為後面有where了 
        @products = Product.available  #定義在model裡面 scope available, -> { where(is_online: ture)}
    end
    
   
    
    def show
    end
    
end
