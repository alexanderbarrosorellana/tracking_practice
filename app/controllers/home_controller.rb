class HomeController < ApplicationController
  def index
    render json: { message: 'API STATUS OK'}, status: :ok
  end
end
