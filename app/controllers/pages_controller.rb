class PagesController < ApplicationController
  authorize_resource :class => PagesController
  
  def index
    @users = User.all
    if user_signed_in?
      @user_activities = Activity.where.not(id: current_user.activities.pluck(:id))
    end
    @promotes = PromoteActivity.where(payed: true)
  end  

  def user_page
    @user = User.find(params[:user_id])
  	@activities = UserActivity.where(user_id: params[:user_id]).order(:created_at).reverse
    @category = Category.all
  end



end
