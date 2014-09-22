class Answer <ActiveRecord::Base
  validates :question_id, :user_id, :presence => true


end
