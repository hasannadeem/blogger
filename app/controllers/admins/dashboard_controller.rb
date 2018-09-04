class Admins::DashboardController < Admins::BaseController
	def index
		@comments = Comment.all.where(id: Report.distinct.pluck(:comment_id))
	end
end