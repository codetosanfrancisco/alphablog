require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username:"john",email:"john@gmail.com",password:"password",admin:true)
  end
  test "get index" do
    get categories_path
    assert_response :success
  end
  
  test "get new" do
    sign_in_as(@user,"password")
    get new_category_path
    assert_response :success
  end
  
  test "should redirect when admin are not logged in" do
    assert_no_difference 'Category.count' do
      post categories_path,params:{category:{name:"Malaysia"}}
    end
    assert_redirected_to categories_path
  end
end
