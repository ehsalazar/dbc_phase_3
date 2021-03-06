class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @post = Post.new
  end

  def create
    category = Category.find(params[:category_id])
    @post = category.posts.build(params[:post])
    if @post.save
      redirect_to category_post_path(category, @post)
    else
      render :new
    end
  end

  def edit
    @categories = Category.all.map {|category| [category.name, category.id]}
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to category_post_path(@post.category, @post)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end
end
