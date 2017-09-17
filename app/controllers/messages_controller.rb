class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    # @groups = current_user.groups.find_by(id: params[:id])
  end
end
