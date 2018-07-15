require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
  def setup
     @user = User.create(username:"john",email:"john@gmail.com",password:"password",admin:true)
  end
  test "create new category,save the new category,and redirect" do
    sign_in_as(@user,"password")
    get new_category_path
    assert_template 'categories/new'
    assert_difference "Category.count",1 do
      post categories_path,params:{category:{name:"singapore"}}
      follow_redirect!
    end
    assert_template 'categories/index'
    assert_match "singapore",response.body #In the response(index),it says that text 
    #'sports' should appear to match
  end
  test "test invalid category" do
    sign_in_as(@user,"password")
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference "Category.count" do
      post categories_path,params:{category:{name:""}}
    end
    assert_template 'categories/new'
    assert_select 'div.form-group' # To check if these element exist on the rendered page
   
  end
end
