class Cart
    
    attr_reader :items
    
    def serialize
        
        all_items= @items.map do |item|
           {"item_id" => item.item_id, "quantity" => item.quantity}
         end
    
      {"cart" => all_items}
      
    end
    
    def self.build_from_hash(hash)
     if hash.nil?
         all_items = []
     else
       all_items = hash["cart"].map {|item|
        CartItem.new(item["item_id"], item["quantity"])
       }
     end 
      
      new(all_items)
      #cc=Cart.new(all_items)等於上一行
      #return cc        等於上上一行                                         
    end                                                   
                                                    
    def initialize(items=[])   
     @items = items
    end
    
    def total_price 
      #  sum=0
      #  @items.each do |item|
      #      sum +=item.price
        @items.inject(0) {|sum, item| sum + item.price}    
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
    
    #def items
    #    return @items  #return 可以不寫
   # end                # attr_reader :items  等於那三行,  還有兩種 寫入 跟 可讀可寫
                       
    def has_item?
        !empty?
    end
    
    
    
    
end