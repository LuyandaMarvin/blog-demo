class AdminController < ApplicationController
  def index
  end

  def posts
    @posts = Post.includes(:user).all
  end

  def comments
  end

  def users
  end

  def show_post
    # @post = Post.includes(:user, :comments).find(params[:id])
    @post = Post.includes(:user, comments: [:user, :rich_text_body]).find(params[:id])
  end
end
