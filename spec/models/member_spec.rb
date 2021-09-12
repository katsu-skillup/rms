require 'rails_helper'

RSpec.describe Member, type: :model do
  before do
    @member = FactoryBot.build(:member)
  end

  describe 'memberの保存' do
    context 'memberが保存できる場合' do
      it '画像、名前、所属、役職、職務内容、総合評価、コミュニケーション能力、リーダーシップ、スキル、モチベーションがあればmemberは保存される' do
        expect(@member).to be_valid
      end
      it '画像が空でも保存できる' do
        @member.image = nil
        @member.position = nil
        expect(@member).to be_valid
      end
    end
    context 'memberが保存できない場合' do
      it '名前が空では保存できない' do
        @member.member_name = nil
        @member.valid?
        expect(@member.errors.full_messages).to include '名前を入力してください'
      end
        
      it '所属が空では保存できない' do
        @member.organization = nil
        @member.valid?
        expect(@member.errors.full_messages).to include '所属を入力してください'
      end
        
      it '職務内容が空では保存できない' do
        @member.work_info = nil
        @member.valid?
        expect(@member.errors.full_messages).to include '職務内容を入力してください'
      end
        
      it '総合評価が空では保存できない' do
        @member.valuation_id = 1
        @member.valid?
        expect(@member.errors.full_messages).to include '総合評価を入力してください'
      end
        
      it 'コミュニケーション能力が空では保存できない' do
        @member.communication = nil
        @member.valid?
        expect(@member.errors.full_messages).to include 'コミュニケーション能力を入力してください'
      end
        
      it 'リーダーシップが空では保存できない' do
        @member.leadership = nil
        @member.valid?
        expect(@member.errors.full_messages).to include 'リーダーシップを入力してください'
      end
        
      it 'スキルが空では保存できない' do
        @member.skill = nil
        @member.valid?
        expect(@member.errors.full_messages).to include 'スキルを入力してください'
      end
        
      it 'モチベーションが空では保存できない' do
        @member.motivation = nil
        @member.valid?
        expect(@member.errors.full_messages).to include 'モチベーションを入力してください'
      end
        
      it 'ユーザーが紐づいていなければ保存できない' do
        @member.user = nil
        @member.valid?
        expect(@member.errors.full_messages).to include 'Userを入力してください'
      end
    end
  end

end
