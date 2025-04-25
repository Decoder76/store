class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  # GET /products.xml
  # GET /products.html
  # GET /products.txt
  # GET /products.csv
  # GET /products.rss
  # GET /products.atom
  def index
    # The index action is used to display a list of all products.
    # It retrieves all products from the database and assigns them to the @products instance variable.
    @products = Product.all
  end

  def show
    # The show action is used to display a single product.
    # It retrieves the product from the database using the ID passed in the URL.
    # The product is then made available to the view for rendering.
  end

  def new
    # The new action is used to display the form for creating a new product.
    # It initializes a new instance of the Product model and assigns it to the @product instance variable.
    @product = Product.new
  end

  def create
    # The create action is used to handle the form submission for creating a new product.
    # It initializes a new instance of the Product model with the parameters passed in the form.
    # If the product is successfully saved to the database, it redirects to the show action for that product.
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # The edit action is used to display the form for editing an existing product.
    # It uses the @product instance variable set by the before_action callback.
    # The form will be pre-populated with the product's current attributes.
    # The form will be submitted to the update action when the user submits it.
  end

  def update
    # The update action is used to handle the form submission for updating an existing product.
    # It retrieves the product from the database using the ID passed in the URL.
    
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # The destroy action is used to delete a product from the database.
    # It retrieves the product from the database using the ID passed in the URL.
    # The product is then destroyed, and the user is redirected to the index action.
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  def search
    # The search action is used to search for products based on a query parameter.
    @products = Product.where("name LIKE ?", "%#{params[:query]}%")
    render :index
  end

# Use callbacks to share common setup or constraints between actions.
  private
    # This method is used to set the @product instance variable for the show, edit, update, and destroy actions.
      # It finds the product by its ID and assigns it to the @product instance variable.
      # The find method raises an ActiveRecord::RecordNotFound exception if the record is not found.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # This is a strong parameter method that specifies which parameters are allowed
    # to be passed to the model.
    # It is used to prevent mass assignment vulnerabilities.
    # In this case, we are allowing the :name attribute to be mass assigned.
    def product_params
      params.expect(product: [ :name ])
    end

end
