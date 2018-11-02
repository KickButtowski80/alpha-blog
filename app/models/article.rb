class Article < ApplicationRecord
    belongs_to :user
    has_many :article_categories
    has_many :categories, through: :article_categories
    
    has_many :comments, as: :commentable , dependent: :destroy
    
    validates :title, presence: true, length: { minimum: 3, maximum: 50},
               uniqueness: {case_sensitive: false}
    validates :description, presence: true, length: { minimum: 10, maximum: 300}
    validates :user_id, presence: true
    
    #  <%= User.find(c.commentable.user_id).username %>
    
    
end
