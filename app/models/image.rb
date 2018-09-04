class Image < ApplicationRecord
	belongs_to :imageable, polymorphic: true
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	validates :avatar, attachment_presence: true
end