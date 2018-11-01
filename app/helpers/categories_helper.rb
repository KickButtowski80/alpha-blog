module CategoriesHelper
    def editCategoryByAdmin category
        if logged_in? && current_user.admin?
            link_to  edit_category_path(category) do             
                content_tag :div, "edit  category name " , class: 'btn btn-primary text-center'
            end
        end        
    end
end
