class User < ActiveRecord::Base
	has_many :posts
	
	#callbacks
	before_save {self.email = email.downcase }

	#email validation
	validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Must be vaild email address"

	
	validates :name, presence: true
	
	validates :email, presence: true,
						uniqueness: true
end
