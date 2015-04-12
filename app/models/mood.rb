class Mood < ActiveRecord::Base

  validates_presence_of :user_id, :date
  validates_uniqueness_of :date, scope: :user_id
  validates_inclusion_of :assignments, :atmosphere, in: 1..5, unless: :results_are_unknown?

  belongs_to :user

  private

  def results_are_unknown?
    self.unknown?
  end

end
