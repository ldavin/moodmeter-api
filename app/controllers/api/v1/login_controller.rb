class Api::V1::LoginController < Api::ApiController

  def create
    trigram = params[:id]

    if trigram.present?

      trigram.upcase!
      @user = User.find_by_trigram trigram

      if @user.nil?
        @user = User.create! trigram: trigram
      end

      render :create, status: :created
    else
      render json: {status: 400, error: '"id" parameter is required'}, status: :bad_request
    end

  end

end
