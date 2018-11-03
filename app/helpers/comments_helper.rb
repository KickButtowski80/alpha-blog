module CommentsHelper
    
  def commenter_name user_id
      User.find(user_id).username 
  end
end
