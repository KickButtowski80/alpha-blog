require 'test_helper'

class ShowACategoryTest < ActionDispatch::IntegrationTest
    
    def setup
        @category = Category.create! name: "Red"        
    end
    
    
    test 'show a category page' do 
        get category_path @category
        # assert_match "Red", response.body       
        assert_select "h1",  text: @category.name
    end
    
    
end