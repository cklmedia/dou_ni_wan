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

  def add_group
    group = Group.new(name:params[:name],user_id:current_user.id)
    if group.save
      flash[:success] = "添加逗群成功！"
      redirect_to :back
    else
      flash[:danger] = "添加都群失败！"
      redirect_to :back
    end
  end

  def add_friend
    
  end

  def key_email
    user = User.find_by_email(params[:email])
    render :json => user.to_json
  end

  private
    def get_user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation,:avatar)
    end
end
