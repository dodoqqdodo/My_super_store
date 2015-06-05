class Product < ActiveRecord::Base
    
    validates :name, presence: true
    
    default_scope {where(is_deleted: false)}  #所有撈出來的資料都是標記為未刪除的
    
    scope :available, -> { where(is_online: true)}
    
    def destroy
     self.is_deleted = true
     save #= self.save
    end
    
end
