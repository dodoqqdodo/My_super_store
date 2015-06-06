class Order < ActiveRecord::Base
    
  validates_presence_of :recipient, :address, :tel, :email
    
  has_many :order_items
    
  def order_id
     "No."+"0000000000#{id}".last(8)
  end
    
  state_machine :status, :initial => :pending do
                #我們的欄位名稱STATUS 預設是STATE
    event :pay do
      transition :pending => :paid
    end
    
    event :ship do
      transition :paid => :shipped
    end
    
    event :deliver do
      transition :shipped => :delivered
    end
    
  end
end
