require 'rails_helper'

RSpec.describe Mood, type: :model do

  describe 'validations' do
    it { should validate_presence_of :user_id }

    it { should validate_presence_of :date }
    it { should validate_uniqueness_of(:date).scoped_to(:user_id) }

    context 'if known results' do
      before { subject.unknown = false }
      it { should validate_inclusion_of(:assignments).in_range(1..5) }
      it { should validate_inclusion_of(:atmosphere).in_range(1..5) }
    end

    context 'if unknown results' do
      before { subject.unknown = false }
      it { should validate_inclusion_of(:assignments).in_range(1..5) }
      it { should validate_inclusion_of(:atmosphere).in_range(1..5) }
    end

  end

  describe 'relations' do
    it { should belong_to :user }
  end

end
