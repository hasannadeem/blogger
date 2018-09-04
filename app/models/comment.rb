class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  has_many :reports, dependent: :destroy
  has_many :reporters, through: :reports, source: :user

  validates :body, presence: true, allow_blank: false
end