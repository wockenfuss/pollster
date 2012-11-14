class Answer < ActiveRecord::Base
  attr_accessible :answer
  belongs_to :question

  validates :answer, presence: true, uniqueness: true
end
