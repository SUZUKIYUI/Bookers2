class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users=User.all
    @user_info=current_user
  end

  def show
    @user=User.find(params[:id])
    @user_info=User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    user=User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  # この下に何も記述しないこと

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
