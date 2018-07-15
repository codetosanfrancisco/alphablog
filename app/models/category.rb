class Category < ApplicationRecord
    has_many :article_categories #has many column in intermediary table
    has_many :articles,through: :article_categories #has many column articles table connected through article_categories table
    validates :name,presence:true,length:{maximum:20,minimum:5},uniqueness:{case_sensitive:false}
end
