class CategoriesController < ApplicationController
  def index
    @categories=Category.all
  end

  def edit
    @category= Category.find(params[:id])
  end
  def update
    @category= Category.find(params[:id])
    if @category.update(params_details)
      redirect_to categories_path, notice: "Category updated successfully"
    end
  end


  def new
    @category=Category.new
  end
  def show
    @category = Category.find(params[:id])
    @title= @category.name
    @posts= @category.post
  end


  def create
    @category=Category.new(params_details)
    if @category.save
      redirect_to categories_path, notice: "Category successfully created"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    puts "-------------------",@category
    @category.destroy
    redirect_to categories_path, notice: "Category was successfully deleted."
  end

  private

  def params_details
params.require(:category).permit(:name)
  end
  
end
