class ActivitiesController < ApplicationController
	authorize_resource

	def create
		@activity = Activity.new
		@activity.name = params[:name]
		@activity.save
		@user_activity = UserActivity.new
		@user_activity.user_id = params[:user_id]
		@user_activity.activity_id = @activity.id
		@user_activity.save
		redirect_to edit_new_user_activity_path(current_user,@activity)
	end

	def edit	
		@activity = Activity.where(id: params[:activity_id]).first
	end

	def update
		@activity = Activity.where(id: params[:activity_id]).first
		@activity.update(author: params[:activity][:author])
		@activity.update(category_id: params[:activity][:category_id])
    	redirect_to user_page_path(current_user)
	end
	
end
