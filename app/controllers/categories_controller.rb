class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  # GET /categories or /categories.json
  def index
    @categories = Category.includes(:todos).all
    @category   = Category.new
  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)

     if @category.save
      redirect_to categories_path(category_id: @category.id), notice: "Category created."
     else
      @categories = Category.all
      render :index, status: :unprocessable_entity
     end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: "Category was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path(category_id: Category.first&.id), notice: "Category deleted."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params.expect(:id))
    end
    def category_params
      params.require(:category).permit(:name, :color)
    end
end
