class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def index
            campers =  Camper.all
            render json: campers.as_json(only: [:id, :name, :age]), status: :ok
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, status: :ok
    end

    def create
        render json: Camper.create!(camper_params), status: :created
    rescue ActiveRecord::RecordInvalid => e
        render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
    end

    private

    def camper_params
        params.permit(:name, :age)
    end

    def not_found
        render json: {error: "Camper not found"}, status: :not_found
    end
end
