module V1
  class UsersController < V1::ApplicationController

    def index
      users = User.all
      render json: users, status: :ok
    end

    def show
      user = User.find_by(id: params[:id])
      if user
        render json: user, status: :ok
      else
        render json: "user with id #{params[:id]} not found", status: :not_found
      end
    end

    def create
      user = User.new(user_params)
      if user.save
        render json: :user, status: :created
      else
        render json: user.errors.messages, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end
end
