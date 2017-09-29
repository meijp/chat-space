class UsersController < ApplicationController
  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def index
    @users = User.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
     # format.html
     format.json
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

end
