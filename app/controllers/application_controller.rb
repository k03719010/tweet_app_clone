class ApplicationController < ActionController::Base
  # before_actionにset_current_userメソッドを指定してください
  before_action :set_current_user
  
  # set_current_userメソッドを定義してください
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  #非ログイン状態でアクセスできないアクションに対する処理
  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインしてください"
      redirect_to("/login")
    end
  end

  #ログイン状態でアクセスできないアクションに対する処理
  def forbit_login_user
    if @current_user
      flash[:notice] = "すでにログインしています"
      redirect_to("/posts/index")
    end
  end
end
