class PostsController < ApplicationController
  def index
     @posts = Post.all
  end
  def show
    @post = Post.find(params[:id])
  end
  def new
    @post=Post.new
    # @categories = Categories.all
  end
  def create
    @post=Post.new(post_params)
    puts "request from the form",params[:post]
    if @post.save
      redirect_to posts_path,notice: "Post created successfully"
    else
    render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id), notice: "Post updated successfully"
    else
      render :post
    end
  end
  def destroy
    puts ".................................."
    puts "params",params[:id]
    @post = Post.find(params[:id])
    puts "post",@post
    @post.destroy
    redirect_to posts_path, notice: "Post was successfully deleted."
  end
  private

  
  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
