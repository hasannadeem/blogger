 class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable

	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :reports, dependent: :destroy
	has_many :likes, dependent: :destroy
	
	has_one  :image, as: :imageable, dependent: :destroy

	accepts_nested_attributes_for :image, :allow_destroy => true
end