class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy] 
     
  def index
    @categories = Category.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
        flash[:success] = "an Category was successfully created"
        redirect_to categories_path
    else
        render 'new'
    end
    
    
  end

  def show
  end
  
  private
  
    def category_params
        params.require(:category).permit(:name)
    end
  
    def set_category
        @category = Category.find(params[:id])
    end
    
  
end
