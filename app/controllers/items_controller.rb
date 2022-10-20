class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new #出品投稿
    
  end

  def create #出品保存
  end
end
