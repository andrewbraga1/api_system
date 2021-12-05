module ApplicationHelper
    
    def filter_to_object(class_value,params)
        obj = {}
        class_value.column_names.each do |item|
            obj[item] = params[item] if params[item]
        end
        return obj
    end

    def mount_query(class_value,object)
        query = []
        object.each do |key, value|
            if key =="status"
                query << class_value.valid.where("status = ?", ActiveModel::Type::Boolean.new.cast(value))
            else
                query << class_value.valid.where("#{key} like ?", "%#{value}%")
            end    
        end
        return query.flatten
    end
	
end
