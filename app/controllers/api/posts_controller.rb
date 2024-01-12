class Api::PostsController < ApplicationController
  before_action :authenticate_api_user!

  def index
    # Fetch your blog posts here
    @posts = [
      { title: 'Post 1', content: 'Content of Post 1' },
      { title: 'Post 2', content: 'Content of Post 2' },
    ]

    render json: @posts
  end

  private

  def authenticate_api_user!
    head :unauthorized unless current_user
  end
end
