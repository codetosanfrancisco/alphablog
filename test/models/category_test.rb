require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new
  end
  
  test 'presence is true' do
    @category.name = ""
    assert_not @category.valid?
  end
  
  test 'max length is 25' do
    @category.name = "a"*100
    assert_not @category.valid?
  end
  
  test 'uniqueness' do
    Category.create(name:'sport')
    @category = Category.new(name:'sport')
    assert_not  @category.valid?
  end
end
