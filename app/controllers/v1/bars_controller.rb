module V1
  class BarsController < V1::ApplicationController
    before_action :authenticate

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