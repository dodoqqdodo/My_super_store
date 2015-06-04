module Admin::ProductsHelper
    
    def online_status(item)
        if item.is_online
            "已上線"
        else
            "未上線"
        end
    end
    
end
