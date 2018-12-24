class Comment < ApplicationRecord
    belongs_to :commentable, polymorphic: true
    validates :content, presence: true, length: {minimum: 5, maximimum: 500}
    
end
