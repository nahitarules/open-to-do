class Api::UsersController < ApplicationController

  before_action :authenticated?

   def index
     render json: users, each_serializer: UserSerializer
   end
end
