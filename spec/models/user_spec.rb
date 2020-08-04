require 'rails_helper'

describe User do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    # 1. nicknameが空では登録できないこと
    it "is invalid without a nickname" do
      @user.valid?
      expect(@user.errors[:nickname]).to include("can't be blank")
    end

    # 2. emailが空では登録できないこと
    it "is invalid without a email" do
      @user.valid?
      expect(@user.errors[:email]).to include("can't be blank")
    end

    # 3. passwordが空では登録できないこと
    it "is invalid without a password" do
      @user.valid?
      expect(@user.errors[:password]).to include("can't be blank")
    end

    # 4. passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # 5. 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # 6. passwordが6文字以上であれば登録できること
    it "is valid with a password that has more than 6 characters " do
      expect(@user).to be_valid
    end

    # 7. passwordが5文字以下であれば登録できないこと
    it "is invalid with a password that has less than 5 characters " do
      @user.valid?
      expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end
end