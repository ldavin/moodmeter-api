require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    it { should validate_presence_of :trigram }
    it { should validate_uniqueness_of :trigram }
  end

  describe '#set_token' do
    let(:user) { build :user }
    subject { user }
    before { user.save! }
    its(:token) { should_not be_blank }
  end

end
