class Cart
    
    def initialize   
     @items =[]
    end
    
    def add_item(id)
        item = @items.find {|item| item.item_id == id}
        
        if item
            item.increment_quantity 
        else
            @items << CartItem.new(id)
        end
        
    end
    
    def empty?
        return @items.empty?  #return 可以不寫
    end
    
    def items
        return @items  #return 可以不寫
    end                # attr_reader :items  等於那三行,  還有兩種 寫入 跟 可讀可寫
                       
    
end