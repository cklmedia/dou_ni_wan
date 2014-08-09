class UsersController < ApplicationController
  def index
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(get_user_params)
  	if @user.save
  	  sign_in @user
      flash[:success] = "欢迎你！#{@user.name}"
      redirect_to users_path
  	else
      flash[:danger] = "注册失败，请重新注册！"
  	  render 'new'
  	end
  end

  private
    def get_user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation,:avatar)
    end
end
