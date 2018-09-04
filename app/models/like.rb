class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
	
  scope	:total_likes,	->(post_id) {	where("post_id = ?",	post_id)}

  validates :user_id, uniqueness: {scope: :post_id}
end