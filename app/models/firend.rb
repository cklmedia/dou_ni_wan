class Firend < ActiveRecord::Base
  # 关系
  belongs_to :group
  belongs_to :user,:class_name => "User", :foreign_key => "user_id",:primary_key =>"id"
  belongs_to :own,:class_name => "User", :foreign_key => "own_id",:primary_key =>"id"

  scope :select_own, ->(id){where("own_id = ?",id)}
  scope :select_own_group, ->(id,g_id){where("own_id = #{id} and group_id = #{g_id}")}
end
