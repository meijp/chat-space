class GroupsController < ApplicationController
  def new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_path
    else
      render :new
    end
  end

  def edit
  end

  private
  def group_params
      params.require(:group).permit(:name)
  end

end
