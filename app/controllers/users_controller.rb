class UsersController < ApplicationController
  def index
    @user=current_user
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
      flash[:danger] = "添加逗群失败！"
      redirect_to :back
    end
  end

  def add_friend
    firend = Firend.new(user_id:params[:id],own_id:current_user.id)
    if firend.save
      flash[:success] = "添加逗友成功！"
      render 'index'
    else
      flash[:danger] = "添加逗友失败！"
      render 'index'
    end
  end

  def key_email
    key=params[:email].gsub("~",".")
    user = User.find_by_email(key)
    # logger.info "--------#{current_user.id}-------------#{user.id}------------------------"
    if Firend.exist_one(user.id,current_user.id).blank?
      render :json => user.to_json
    else
      render :json => "".to_json
    end
  end

  private
    def get_user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation,:avatar)
    end
end
