class Answer < ActiveRecord::Base
  attr_accessible :answer, :question_id
  belongs_to :question

  validates :answer, presence: true, uniqueness: true
end
