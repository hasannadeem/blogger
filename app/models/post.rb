class Post < ApplicationRecord
	belongs_to :user

	has_many :comments, dependent: :destroy
	has_many :images,	as:	:imageable, dependent: :destroy
	has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user

	accepts_nested_attributes_for :images, :allow_destroy => true

	# scope

	validates :title, :serial, presence: true

	before_validation :set_serial

	private
	def set_serial
		self.serial = "aaa" + self.user_id.to_s + "bbb"
	end
end