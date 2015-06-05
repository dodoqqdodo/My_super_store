class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  devise :omniauthable, :omniauth_providers => [:facebook]
  
  def self.from_omniauth(auth)       
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    #user.name = auth.info.name   # assuming the user model has a name      #若沒有先關掉
    #user.image = auth.info.image # assuming the user model has an image   #若沒有先關掉
  end
  end
  
  def is_admin?
     role == 'admin'
     # self.role == 'admin' 跟上面一樣
     
     # role = 'admin'  #這是區域變數  會變成是指定
     # self.role = 'admin'  #這是直接改role變成admin 在這類別中
     #eamil == 'dodo@cc.dd' 爛招
  end
  
  
  
end
