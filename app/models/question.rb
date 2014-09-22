class Question <ActiveRecord::Base
  validates :question, :user_id, :presence => true
  validates_uniqueness_of :question

end
