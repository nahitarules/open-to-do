class Api::ListsController < ApiController

  before_action :authenticated?

  def index
    user = my_user
    lists = user.lists.all
      render json: user.lists, each_serializer: ListSerializer
  end

  def create
    user = my_user
    list = user.lists.new(list_params)

    if list.save
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:user_id, :name, :private)
  end

  def my_user
    User.where(id: params[:user_id]).first
  end
end
