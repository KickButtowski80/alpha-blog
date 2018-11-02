class ArticlesController < ApplicationController  
   before_action :set_article, only: [:show, :edit, :update, :destroy] 
   before_action :require_user,  only: [:new, :create, :edit, :update, :destroy]
   before_action :require_same_user, only: [:edit, :update, :destroy]
                
    def index
        @articles = Article.paginate(:page => params[:page], :per_page => 5)
    end
    
    def new
        @article = Article.new 
    end
    
    def create     
        # render plain: params[:article].inspect
        @article = Article.new(article_params)
        @article.user = current_user
        
     
        if @article.save
            flash[:success] = "an Article was successfully created"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end
    
   def show     
         @commentable = Article.find(params[:id])
         @comments = @commentable.comments
        #  @comments = Comment.commenter_name(current_user)
   end
    
  def edit     
  end
  
  def update
     
      if @article.update(article_params)
          flash[:success] = "an Article was successfully edited" 
          redirect_to article_path(@article)
        else
            render 'edit'
        end
  end
  
  def destroy
     
    if @article.destroy
        flash[:danger] = "Article was successfully deleted"
        redirect_to articles_path
    end
  end
    
    private 
        def article_params
            params.require(:article).permit(:title, :description, :user_id, category_ids: [] )
        end
 
        def set_article
            @article = Article.find(params[:id])
        end
        
        def require_same_user 
            if current_user != @article.user && !current_user.admin?
                flash[:danger] = "You can only edit or delete your own articles"
                redirect_to root_path
            end
        end
 
end
