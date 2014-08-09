class User < ActiveRecord::Base
  # 头像上传
  mount_uploader :avatar, AvatarUploader
  
  # 密码加密
  has_secure_password

  # 得到身份
  def get_level
  	array=["齐天大圣","猴钻风","逗儿"]
  	array[self.level]
  end

end
