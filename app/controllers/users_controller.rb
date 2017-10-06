class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def show
    @user_cart = @user.cart
    @cartitems = @user_cart.cartitems
  end 
  def delete_user
    @cart = Cart.find(params[:cart_id])
    @user = User.find(params[:user_id])
    @user.destroy
    redirect_to users_path
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
end