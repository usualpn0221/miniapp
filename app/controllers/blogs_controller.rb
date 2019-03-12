class BlogsController < ApplicationController
  def index
    @blogs = Blog.includes(:user)
  end

  def new

  end

  def create
    Blog.create(title: blog_params[:title],content: blog_params[:content],user_id:current_user.id)
  end

    def update
      blog = Blog.find(params[:id])
        blog.update(blog_params) if blog.user_id == current_user.id
    end

    def edit
      @blog = Blog.find(params[:id])
    end

    def destroy
      blog = Blog.find(params[:id])
        blog.destroy if blog.user_id == current_user.id
    end

    def show
    @blog = Blog.find(params[:id])
    end

  private
    def blog_params
      params.permit( :content,:title)
    end

    def move_to_index
     unless user_signed_in?
     redirect_to action: :index
     end# ログインしていなかった場合、「index」アクションを実行する
    end
end
