module V1
  class UsersController < ApplicationController
    before_action :authenticate, except: [:create]

    def index
      users = User.all
      render json: users, status: :ok
    end

    def show
      user = User.find_by(id: params[:id])
      if user
        respond_to do |format|
          format.json { render json: user, status: 200 }
          format.xml { render xml: user, status: 200 }
        end
      else
        render json: "user with id #{params[:id]} not found", status: :not_found
      end
    end

    def create
      user = User.new(user_params)
      if user.save
        render json: user, status: :created
      else
        render json: user.errors.messages, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :first_name, :last_name,
                                   :address, :city, :state, :zip,
                                   :password, :password_confirmation)
    end
  end
end