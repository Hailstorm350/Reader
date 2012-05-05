class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :role, presence: true
  has_secure_password
  
  def self.admin
    'admin'
  end
  
  def self.reader
    'reader'
  end
  
  def self.is_admin(user_id)
    User.find_by_id(user_id).role == User.admin
  end
  
  def self.is_reader(user_id)
    if user = User.find_by_id(user_id)
      role = user.role
      role == User.reader || role == User.admin
    end
  end
  
  def role
    self[ :role ]
  end
end
