class UserActivitiesController < ApplicationController
	
  def create
  @activity = UserActivity.new
  @activity.user_id = params[:user_id]
  @activity.activity_id = params[:activity_id]
  authorize! :create, @activity
  @activity.save
  redirect_to edit_activity_path(@activity.user_id,@activity.activity.id)
  end

  def edit
  	@user = User.find(params[:user_id])
    @activity = UserActivity.where(user_id: params[:user_id], activity_id: params[:activity_id]).first
    authorize! :edit, @activity
  end


  def update
    @activity = UserActivity.where(user_id: params[:user_id], activity_id: params[:activity_id]).first
    authorize! :update, @activity
    @activity.update(start: params[:user_activity][:start])
    redirect_to user_page_path
  end


  def destroy
  	@activity = UserActivity.where(user_id: params[:user_id], activity_id: params[:activity_id]).first
  	authorize! :destroy, @activity
    @activity.destroy
    redirect_to user_page_path, notice: 'La actividad fue eliminada'
  end

end
