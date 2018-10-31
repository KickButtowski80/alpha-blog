require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
    def setup
        @category = Category.new name: "sports"    
        @category.save!
        @admin = User.create! username: "john", email: "john@example.com", password: "password", admin: true
        @user = User.create! username: "user", email: "user@example.com", password: "password", admin: false
    end
    
    test 'should get categories index' do
        get categories_path
        assert_response :success
    end
    
    test 'should get new' do
        sign_in_as @admin,"password"
        get new_category_path
        assert_response :success
    end
    
    
    test 'should get show' do
        get category_path @category
        assert_response :success
    end
    
   test "should redirect create when admin not logged in" do
        sign_in_as @user, "password"
        assert_no_difference "Category.count" do
            post categories_path, params: { category: {name: "sports"}}         
        end    
        assert_redirected_to categories_path
   end
   
   test 'admin user create new category when it is logged in' do
        sign_in_as @admin,"password"
        assert_difference "Category.count", 1 do
            post categories_path, params: {category: {name: "biking"}}
            follow_redirect!  
        end
        assert_template 'categories/index'
        assert_match "biking" , response.body
   end
   
   test 'no admin user cannot see new category page' do
        sign_in_as @user, "password"
        get new_category_path
        assert_response :redirect          
   end
   
   
end
