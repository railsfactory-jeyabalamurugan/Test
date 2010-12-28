require 'digest'
class Operation < ActiveRecord::Base

	attr_accessor :password
	validates     :username, :presence=>true, :uniqueness => true, :length=>{ :within=>5..15}
	validates     :email, :presence=>true, :uniqueness => true, :length => { :within => 5..50 },:format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }
	validates     :password, :confirmation=>true, :length=>{ :within=>3..12},:if => :password_required?
        validates     :username, :presence=>true
	before_save   :encrypt_new_password
	
	def self.authenticate(username, password)
		user = find_by_username(username)
		return user if username && user.authenticated?(password)
        end
	
	def authenticated?(password)
		self.hashed_password == encrypt(password)
	end

	def encrypt_new_password
		return if password.blank?
		self.hashed_password = encrypt(password)
	end
	
	def password_required?
		hashed_password.blank? || password.present?
	end
	
	def encrypt(string)
		Digest::SHA1.hexdigest(string)
	end
end 

