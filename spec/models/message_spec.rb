require 'rails_helper'

  describe Message do
    describe '#create' do
      it "is valid with a body, image" do
        message = build(:message)
        expect(message).to be_valid
      end

      it "is valid with a body" do
        message = build(:message, image: nil)
        expect(message).to be_valid
      end

      it "is valid with a image" do
        message = build(:message, body: nil)
        expect(message).to be_valid
      end

      it "is invalid without a group_id" do
        message = build(:message, group: nil)
        message.valid?
        expect(message.errors[:group]).to include("を入力してください")
      end

      it "is invalid without a user_id" do
        message = build(:message, user: nil)
        message.valid?
        expect(message.errors[:user]).to include("を入力してください")
      end

      it "is invalid without a body, image" do
        message = build(:message, body: nil, image:nil)
        expect(message).to_not be_valid
      end

  end
end
