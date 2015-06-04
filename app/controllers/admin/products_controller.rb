class Admin::ProductsController < ApplicationController
    
    layout 'admin'
    
    def index
        #@products = Product.page(params[:page]).per(10).where(is_deleted:false) #因為有裝KAMINAMI,直接用分頁功能
                                         #判斷是否被標記為未刪除的才顯示   
                                         #因為太醜了 所以在Model寫個scope 預設撈出來的就是未標記刪除的
       @products = Product.page(params[:page]).per(10)                   
                                                            
    end                                                
    
    
    def new
        @product = Product.new
    end
    
    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to admin_products_path, notice:'新增商品成功'
        else
            render :new
        end
    end
    
    def destroy
        @product = Product.find_by(id: params[:id])
        
        #@product.destroy  方法一
        #@product.is_deleted = true
        #@product.save                方法二
        
        @product.destroy  #複寫destroy方法在 model內 包入了@product.is_deleted =true @product.save 的方法
        redirect_to admin_products_path, notice: '商品已刪除'
    end
    
    
    
    private
    def product_params
        params.require(:product).permit(:name, :description, :price, :is_online)
    end
    
    
end
