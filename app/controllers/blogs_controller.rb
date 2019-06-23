class BlogsController < ApplicationController

  before_action :move_index, except: :index

  def index
    @blogs = Blog.includes(:user).order("created_at DESC").page(params[:page]).per(4)
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(image: blogs_params[:image], text: blogs_params[:text], user_id: current_user.id)
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
      if blog.user_id == current_user.id
        blog.update(blog_params)
      end
  end

  def destroy
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.destroy
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  private
  def blog_params
    params.permit(:image, :text)
  end

  def blogs_params
    params.require(:blog).permit(:image, :text)
  end
  
  def move_index
    redirect_to action: :index unless user_signed_in?
  end

end
