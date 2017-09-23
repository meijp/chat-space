require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:message) { build(:message) }
  # user、group、messageをcreateし、let内に格納

  describe 'GET #index' do
    #controller_macros.rb内のlogin_userメソッドを呼び出し
    before do
      login_user user
    end

    context 'user login' do

      it "@group" do
        get :index, params: { group_id: group }
        expect(assigns(:group)).to eq(group)
      end

      it "@message" do
        blank_message = Message.new
        get :index, params: { group_id: group }
        expect(assigns(:message).attributes).to eq(blank_message.attributes)
      end

      it "current_user test" do
        get :index, params: { group_id: group.id, user_id: user.id }
        expect(assigns(:current_user)).to eq(subject.current_user)
      end

      it "renders index template" do
        get :index, params: { group_id: group }
        expect(response).to render_template :index
      end
    end

    context 'user not login' do

      it 'redirects to new_user_session_path' do
        redirect_to new_user_session_path
      end
    end
  end


  describe 'POST #create' do

    context "when save message" do
      before do
        login_user user
      end

      it "save the new message in the database" do
        expect do
        post :create, params: { group_id: group, message: attributes_for(:message) }
        end.to change(Message, :count).by(1)
      end

      it 'redirect to group_messages_path' do
        post :create, params: { group_id: group, message: attributes_for(:message) }
        expect(response).to redirect_to group_messages_path
      end
    end

    context "when missed save message" do
      before do
        login_user user
      end

      it "can NOT save the new message in the database" do
        expect do
        post :create, params: { group_id: group, message: attributes_for(:message, body: nil, image: nil) }
        end.to change(Message, :count).by(0)
      end

      it 'redirects to group_messages_path' do
        message = build(:message, body:"")
        post :create, params: { group_id: group, message: attributes_for(:message) }
        expect(response).to redirect_to group_messages_path
      end
    end

    context 'user not login' do
      it 'redirects to new_user_session_path' do
        redirect_to new_user_session_path
      end
    end

  end
end
