class MessagesController < ApplicationController

  def index
    @groups = current_user.groups.order(created_at: :DESC)
    @group = Group.find(params[:group_id])
    @message = Message.new
    @messages = current_user.messages
  end

  def new
  end

  def create
    @group = Group.find(params[:group_id])
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path(@group), notice: "メッセージを作成しました"
    else
      flash[:alert] = "テキストまたは画像を入力してください"
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

end
