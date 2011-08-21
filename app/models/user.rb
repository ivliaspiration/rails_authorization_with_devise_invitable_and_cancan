class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :invitable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  before_save :make_author_if_invited
  has_many :articles
  
  
  def admin?
    false
  end
  
  def author?
    false
  end
  
  protected
  def make_author_if_invited
    if self.invitation_token.present?
      self.type = "Author"
      self.invited_by_type = "Admin"
    end
  end
end
