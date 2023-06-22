class ItemsController < ApplicationController

  def index
    user = User.find_by(id: params[:user_id])
    if user.nil?
      render json: { error: 'User not found' }, status: :not_found
    else
      items = user.items
      render json: items
    end
  end
  

   def show
    user = User.find_by(id: params[:user_id])
    if user.nil?
      render json: { error: 'User not found' }, status: :not_found
    else
      item = user.items.find_by(id: params[:id])
      if item.nil?
        render json: { error: 'Item not found' }, status: :not_found
      else
        render json: item
      end
    end
  end
  
  def create
    user = User.find_by(id: params[:user_id])
    if user.nil?
      render json: { error: 'User not found' }, status: :not_found
    else
      item = user.items.build(item_params)
      if item.save
        render json: item, status: :created
      else
        render json: { error: 'Failed to create item' }, status: :unprocessable_entity
      end
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :description)
  end
  
end
