require "test_helper"
require "rails/test_help"
require "bcrypt" # Ensure BCrypt is loaded for fixtures

class ProductsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end

require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one) # Assuming a fixture named :one exists in products.yml
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
    assert_select "h1", @product.name # Assuming the product name is displayed in an <h1> tag
   end

  test "should return 404 for non-existent product" do
    assert_raises(ActiveRecord::RecordNotFound) do
      get product_url(id: 9999) # Use an integer ID that does not exist
    end
  end
end

def show
  @product = Product.find(params[:id])
rescue ActiveRecord::RecordNotFound
  head :not_found
end
