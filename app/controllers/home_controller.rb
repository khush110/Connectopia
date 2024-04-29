class HomeController < ApplicationController
  def index
    render
  end
  def about
  end
  def profile
    @user = current_user
    @posts = @user.posts
  end
end

