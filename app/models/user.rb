
class User < ApplicationRecord

  has_and_belongs_to_many :places, dependent: :destroy
  has_many :locations, class_name: "Place", foreign_key: "user_id"
 
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates_presence_of :email,:display_name
  validates :email, email: true, uniqueness: true, allow_nil: false
  validates :password, length: { minimum: 5, maximum: 25}
  validates :username, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save :build_username     

  after_create :assign_default_role

  scope :public_users, -> (current_user){ without_role(:admin).where.not(id: current_user.id) }



  def admin?
    has_role? :admin
  end

  

  private

  def build_username
  	if self.username.nil?
  		self.username = self.email.gsub(/[^0-9a-zA-Z-_]/, "")
  	else
  		self.username = self.username.gsub(/[^0-9a-zA-Z-_]/, "")
  	end
  	
  end


  def assign_default_role
    self.add_role(:subscriber) if self.roles.blank?
  end  

end

 


