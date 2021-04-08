class User < ApplicationRecord

  has_many :colleges
  has_many :lectures, through: :colleges

  belongs_to :parent, class_name: "User", optional: true
  has_many :children, class_name: "User", foreign_key: "parent_id" 

  has_one :profile
  accepts_nested_attributes_for :profile, allow_destroy: true, reject_if: :all_blank
  
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :validatable, 
         authentication_keys: [:login]
  # has_and_belongs_to_many :lectures

 attr_writer :login


 scope :active, -> { where(active: true) }

  

 #validate :password_complexity

   validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
 

  def login
    @login || self.username || self.email
  end


  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end

 
  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-5])(?=.*?[#?!@$%^&*-]).{8,70}$/

    errors.add :password, 'Complexity requirement not met. Length should be 8-70 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end

  def with_profile
    build_profile if profile.nil?
    
    
  end

  
end