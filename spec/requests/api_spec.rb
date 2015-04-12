require 'rails_helper'

RSpec.describe 'Access control', type: :request do

  let(:header_parameter) { {'X-API-KEY' => ENV['API_ACCESS_CONTROL']} }

  context 'when the access token is correct' do
    it 'returns a 200' do
      get '/api/status.json', nil, header_parameter
      expect(response.status).to eq 200
    end
  end

  context 'when the access token is incorrect' do
    it 'returns a 401 error' do
      get '/api/status'
      expect(response.status).to eq 401
    end
  end

end