class SessionsController < ApplicationController
  def new
 	
  end

  def create
	  user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = "欢迎你！#{user.name}"
      redirect_to users_path
    else
      flash[:danger] = "用户名或密码不一致，请确认重新登录！"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id]=nil
    redirect_to new_session_path
  end
end
