require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    it { should validate_presence_of :trigram }
    it { should validate_uniqueness_of(:trigram).case_insensitive }
  end

  describe 'relations' do
    it { should have_many :moods }
  end

  describe '#set_token' do
    let(:user) { build :user }
    subject { user }
    before { user.save! }
    its(:token) { should_not be_blank }
  end

  describe '#uppercase_trigram' do
    let(:user) { build :user, trigram: 'lda' }
    subject { user }
    before { user.save! }
    its(:trigram) { should eq 'LDA' }
  end

end
