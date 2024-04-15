class Admin::DashboardsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  #
  def index
      @users = User.all
  end
  #なんでユーザー情報取れているんだ？deviceの機能内にUserモデルがあるからか？
end
