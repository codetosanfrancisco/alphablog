class User < ApplicationRecord
	has_secure_password
	has_many :articles,dependent: :destroy
	before_save {self.email = self.email.downcase}
	validates :username,presence:true,
	length:{minmum:5,maximum:15},
	uniqueness:{case_sensitive:false}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,presence:true,
	uniqueness:{case_sensitive:false},
	format:{with: VALID_EMAIL_REGEX}
	
end
