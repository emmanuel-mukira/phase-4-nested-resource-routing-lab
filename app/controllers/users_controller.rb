# app/controllers/users_controller.rb
class UsersController < ApplicationController
  # GET /users/:id
  def show
    @user = User.find(params[:id])
    render json: @user, include: :items
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User not found' }, status: :not_found
  end
end
