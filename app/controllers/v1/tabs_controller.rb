module V1
  class TabsController < ApplicationController
    before_action :authenticate
    before_action :get_user

    def index
      render json: @user.tabs, status: :ok
    end

    def show
      tab = @user.tabs.find_by(id: params[:id])
      if tab
        render json: tab, status: :ok
      else
        render json: "tab not found", status: :not_found
      end
    end

    protected

      def get_user
        @user = User.find_by(id: params[:user_id])
      end

  end
end
