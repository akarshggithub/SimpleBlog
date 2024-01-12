class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Fetch your blog posts here
    @posts = [
      { title: 'Post 1', content: 'Content of Post 1' },
      { title: 'Post 2', content: 'Content of Post 2' },
    ]
  end

  private

  def authenticate_user!
    redirect_to login_path unless current_user
  end
end
