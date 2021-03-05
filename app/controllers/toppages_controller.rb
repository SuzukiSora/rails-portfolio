class ToppagesController < ApplicationController
  def index
    @posts = current_user.posts.order(id: :desc).page(params[:page])
  end
end
