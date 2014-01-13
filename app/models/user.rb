class User < ActiveRecord::Base
	#attr_accessor :nom , :prenom, :email

	validates :nom,  presence: true, length: { maximum: 50 }
	validates :prenom,  presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },uniqueness: true
	before_save { self.email = email.downcase }
	before_create :create_remember_token
 	has_secure_password
 	validates :password, length: { minimum: 6 }

 	has_many :competences, dependent: :destroy


  has_attached_file :avatar, :styles => {:small => "150x150"}
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']


  def User.new_remember_token
  	SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
	    Digest::SHA1.hexdigest(token.to_s)
	end

  	private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
