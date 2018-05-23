class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable,  :omniauthable, omniauth_providers: [:facebook]

  validates :fullname, presence: true, length: {maximum: 50}

  def self.find_for_oauth(auth)
    user = User.where(email: auth.info.email, provider: auth.provider).first

    unless user
      user = User.create(
        fullname: auth.info.name,
        uid:      auth.uid,
        provider: auth.provider,
        image:    auth.info.image,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
    end

    user
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
