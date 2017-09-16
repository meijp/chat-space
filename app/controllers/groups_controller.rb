class GroupsController < ApplicationController
  def index
    @group = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: "グループを作成しました"
    else
      render :new
    end
  end

  def show
  end

  def edit
    renew_params
  end

  def update
    renew_params
    if @group.update(group_params)
      redirect_to root_path, notice: "グループを編集しました"
    else
      render :edit, alert: "編集に失敗しました"
    end
  end

  private
  def group_params
      params.require(:group).permit(:name)
  end

  def renew_params
      @group = Group.find(params[:id])
  end
end
