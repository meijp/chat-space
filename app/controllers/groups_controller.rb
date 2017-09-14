class GroupsController < ApplicationController
  def new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
    else
      render :new
    end
  end

  def edit
  end

  private
  def group_params
      params.permit(:name)
  end

end
