class MypageController < ApplicationController
  # ログインユーザのみアクセス許可
  before_action :authenticate_user!

  def show
    # 指定されたIDのユーザ情報を取得
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
    if @user.id != current_user.id
      redirect_to mypage_path(current_user)
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to mypage_path(user.id)
  end

   private

    # 許可するユーザ情報のパラメータ
    def user_params
      params.require(:user).permit(:name, :email, :content)
    end

  
end
