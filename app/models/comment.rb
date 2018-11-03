class Comment < ApplicationRecord
    belongs_to :commentable, polymorphic: true
    # User.find(c.commentable.user_id).username
    scope :commenter_name , ->(user) { User.find(user).username } 
   
end
