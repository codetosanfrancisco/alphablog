class Category < ApplicationRecord
    validates :name,presence:true,length:{maximum:20,minimum:5},uniqueness:{case_sensitive:false}
end
