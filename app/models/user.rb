class User < ActiveRecord::Base
	validates :first_name, presence: true 
	validates :last_name, presence: true
	validates :email, presence: true, 
										uniqueness: true, 
										format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
	has_secure_password
end
