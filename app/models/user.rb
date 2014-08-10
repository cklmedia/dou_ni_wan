class User < ActiveRecord::Base
  # 头像上传
  mount_uploader :avatar, AvatarUploader
  
  # 密码加密
  has_secure_password

  # 关系
  has_many :groups
  has_many :firends,:class_name => "Firend", :foreign_key => "user_id",:primary_key =>"id"
  has_many :firends,:class_name => "Firend", :foreign_key => "own_id",:primary_key =>"id"

  # scope :select_email, -> (key){where("email like '#{key}%'")}

  # 得到身份
  def get_level
  	array=["齐天大圣","猴钻风","逗儿"]
  	array[self.level]
  end

end
