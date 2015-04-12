class Api::StatusController < Api::ApiController

  def index
    @current_version = 'v1'
  end

end
