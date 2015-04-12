class Api::ApiController < ActionController::Base

  protect_from_forgery with: :null_session
  before_filter :allow_access

  private

  def allow_access
    api_key = request.headers['X-API-KEY']

    unless api_key == ENV['API_ACCESS_CONTROL']
      render json: {status: 401, error: 'The "X-API-KEY" header parameter must be specified with the correct value'}, status: :unauthorized
      return
    end
  end

end