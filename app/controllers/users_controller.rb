class UsersController < ApplicationController
  
  before_action :authenticate_user!, only: [:index, :show, :edit]


  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
    set_user
    @relationship = current_user.relationships.find_by(follow_id: @user.id)  
    @set_relationship = current_user.relationships.new
    @posts = @user.posts.order(id: :desc).page(params[:page])
  end

  def edit
    set_user
  end

  def update
    set_user
    @user.update(user_params)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :comment, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end


end
