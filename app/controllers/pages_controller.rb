class PagesController < ApplicationController
  include ApplicationHelper
  def homepage
    redirect_to articles_path if logged_in?
  end

  def about
  end
end
