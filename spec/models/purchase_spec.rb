require 'rails_helper'

describe Purchase do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: user.id)
      @purchase = FactoryBot.create(:purchase)
    end
    # 1.postcodeが空では登録できないこと
    it "is invalid without a postcode" do
      @purchase.postcode = ""
      @purchase.valid?
      expect(@purchase.errors[:postcode]).to include("can't be blank")
    end

    # 2.prefecturecodeが空では登録できないこと
    it "is invalid without a prefecturecode" do
      @purchase.prefecturecode = ""
      @purchase.valid?
      expect(@purchase.errors[:prefecturecode]).to include("can't be blank")
    end
    
    # 3.cityが空では登録できないこと
    it "is invalid without a city" do
      @purchase.city = ""
      @purchase.valid?
      expect(@purchase.errors[:city]).to include("can't be blank")
    end

    # 4.housenumberが空では登録できないこと
    it "is invalid without a housenumber" do
      @purchase.housenumber = ""
      @purchase.valid?
      expect(@purchase.errors[:housenumber]).to include("can't be blank")
    end

    # 5.phonenumberが空では登録できないこと
    it "is invalid without a phonenumber" do
      @purchase.phonenumber = ""
      @purchase.valid?
      expect(@purchase.errors[:phonenumber]).to include("can't be blank")
    end
  end
end