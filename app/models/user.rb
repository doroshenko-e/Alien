class User < ApplicationRecord

  has_many :rooms
  has_many :reservations
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable,  :omniauthable, omniauth_providers: [:facebook]

  validates :fullname, presence: true, length: {maximum: 50}

  def self.find_for_oauth(auth)
    user = User.where(email: auth.info.email).first
    if user
      return user
    else
      user = User.where(email: auth.info.email, provider: auth.provider).first_or_create do |user|
        user.fullname = auth.info.name
        user.uid = auth.uid
        user.provider = auth.provider
        user.image = auth.info.image
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
      end
    end
  end

  def self.new_with_session(params, session)
   super.tap do |user|
     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
       user.email = data["email"] if user.email.blank?
     end
   end
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end  
end
