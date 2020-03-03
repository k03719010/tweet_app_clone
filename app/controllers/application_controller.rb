class ApplicationController < ActionController::Base
  # before_actionにset_current_userメソッドを指定してください
  before_action :set_current_user
  
  # set_current_userメソッドを定義してください
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインしてください"
      redirect_to("/login")
    end
  end
end
