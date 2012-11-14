class Question < ActiveRecord::Base
  attr_accessible :question, :poll_id
  has_many :answers
  belongs_to :poll

  validates :question, presence: true
end
