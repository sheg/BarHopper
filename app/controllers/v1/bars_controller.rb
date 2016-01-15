module V1
  class BarsController < ApplicationController
    before_action :authenticate

    def index
      bars = Bar.all
      render json: bars, status: :ok
    end

    def show
      bar = Bar.find_by(id: params[:id])

      if bar
        render json: bar, status: :ok
      else
        render json: "Bar with id #{params[:id]} not found", status: :not_found
      end
    end
  end
end