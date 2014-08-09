class Group < ActiveRecord::Base
  # 关系
  belongs_to :user
  
  scope :select_own, ->(id){where("user_id = ? ",id)}
  
end
