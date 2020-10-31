require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'test' do
    
    context 'email test' do
      it 'メールアドレスが空白であると無効' do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end

      it 'メールアドレスが空白でないと有効' do
        user = build(:user, email: 'test@gmail.com')
        expect(user).to be_valid
      end

      it 'メールアドレスに全角文字が入っていると無効' do
        user = build(:user, email: "satsukiさつき@gmail.com")
        user.valid?
        expect(user.errors[:email]).to include("は不正な値です")
      end

      it 'メールアドレスに全角文字が入っていないと有効' do
        user = build(:user, email: "satsuki@gmail.com")
        expect(user).to be_valid
      end

      it 'メールアドレスを二重に登録すると無効' do
        user = create(:user)
        other_user = build(:user)
        other_user.valid?
        expect(other_user.errors[:email]).to include("はすでに存在します")
      end
    end

    context 'passward test' do
      it '全角英字が含まれた場合、無効' do
        user = build(:user, password: 'A' * 8)
        user.valid?
        expect(user.errors[:password]).to include('は半角英字と半角数字のいずれとも含まれ、8文字以上32文字以下である必要があります')
      end

      it 'password 長さが8桁未満の場合、無効' do
        user = build(:user, password: 'a'* 7)
        user.valid?
        expect(user.errors[:password]).to include('は半角英字と半角数字のいずれとも含まれ、8文字以上32文字以下である必要があります')
      end

      it 'password 長さが32桁を超えた場合、無効' do
        user = build(:user, password: 'a'* 33)
        user.valid?
        expect(user.errors[:password]).to include('は半角英字と半角数字のいずれとも含まれ、8文字以上32文字以下である必要があります')
      end
    end
  end
end
