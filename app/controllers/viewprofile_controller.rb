class ViewprofileController < ApplicationController
  def view
  	@posts = current_user.posts
  end
end