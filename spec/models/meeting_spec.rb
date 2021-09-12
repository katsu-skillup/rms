require 'rails_helper'

RSpec.describe Meeting, type: :model do
  before do
    @meeting = FactoryBot.build(:meeting)
  end

  describe 'meetingの保存' do
    context 'meetngが保存できる場合' do
      it 'meeting_date、meeting_imfoがあればmennberは保存される' do
        expect(@meeting).to be_valid
      end
    end

    context 'meetingが保存できない場合' do
      it '面談日が空では保存できない' do
        @meeting.meeting_date = nil
        @meeting.valid?
        expect(@meeting.errors.full_messages).to include '面談日を入力してください'
      end
      it '面談内容が空では保存できない' do
        @meeting.meeting_info = nil
        @meeting.valid?
        expect(@meeting.errors.full_messages).to include '面談内容を入力してください'
      end
      it 'ユーザーが紐づいていなければ保存できない' do
        @meeting.user = nil
        @meeting.valid?
        expect(@meeting.errors.full_messages).to include 'Userを入力してください'
      end
      it 'メンバーが紐づいていなければ保存できない' do
        @meeting.member = nil
        @meeting.valid?
        expect(@meeting.errors.full_messages).to include 'Memberを入力してください'
      end

    end
  end
end
