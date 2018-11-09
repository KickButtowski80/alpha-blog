class CommentsController < ApplicationController
  before_action :load_commentable
  before_action :checked_logged_in, only: [ :create]

  
  def create
    @comment = @commentable.comments.new(comment_params) 
    @comment.user_id = current_user.id
    @comment.commenter = current_user.username
    
     
    if @comment.blank? || @comment.save
      flash[:success] = "Commented was created"
      redirect_to @commentable
    else       
       flash[:danger]  = render_to_string(:partial => 'shared/error_form_messaging',
                                          :locals => {obj: @comment}, 
                                          format: :html)
       redirect_to @commentable   
    end
  end
private
  
  def comment_params
      params.require(:comment).permit(:content, :commenter, :user_id)
  end
  def load_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
  
  def checked_logged_in
    unless logged_in?
      flash[:danger] = 'please log in to be able to comment'
      redirect_to login_path
    end
  end
  
end
