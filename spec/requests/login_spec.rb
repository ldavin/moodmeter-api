require 'rails_helper'

RSpec.describe 'Login', type: :request do

  context 'with new user' do
    it 'creates a new user and return its token' do
      parameters = {id: 'MOB'}
      post '/api/v1/login.json', parameters
      expect(response.body).to match /"id":"MOB","token":"\w+"/
    end
  end

  context 'with an existing user' do

    let(:existing_trigram) { 'LDA' }
    let(:existing_token) { 'zeMegaToken' }
    let!(:existing_user) { create :user, trigram: existing_trigram }
    before :each do
      existing_user.update_attribute(:token, existing_token)
    end

    it 'returns its token' do
      parameters = {id: existing_trigram}
      post '/api/v1/login.json', parameters
      expect(response.body).to match /"id":"#{existing_trigram}","token":"#{existing_token}"/
    end
  end

end