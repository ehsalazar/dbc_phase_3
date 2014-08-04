class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @categories = Category.all
    @post = Post.new
  end

  def create
    category = Category.find_or_create_by_name(params[:category].downcase)
    @post = category.posts.build(params[:post])
    if @post.save
      redirect_to post_path(@post)
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
      redirect_to post_path(@post)
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
