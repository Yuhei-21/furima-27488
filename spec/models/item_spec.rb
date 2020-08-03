require 'rails_helper'

describe Item do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    # 1.nameが空では登録できないこと
    it "is invalid without a name" do
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    # 2. item_explanationが空では登録できないこと
    it "is invalid without a item_explanation" do
      item.valid?
      expect(item.errors[:item_explanation]).to include("can't be blank")
    end

    # 3. categoryが空では登録できないこと
    it "is invalid without a category" do
      item.valid?
      expect(item.errors[:category]).to include("can't be blank")
    end

    # 4. conditionが空では登録できないこと
    it "is invalid without a condition" do
      item.valid?
      expect(item.errors[:condition]).to include("can't be blank")
    end

    # 5. postage_payerが空では登録できないこと
    it "is invalid without a postage_payer" do
      item.valid?
      expect(item.errors[:postage_payer]).to include("can't be blank")
    end

    # 6. postage_typeが空では登録できないこと
    it "is invalid without a postage_type" do
      item.valid?
      expect(item.errors[:postage_type]).to include("can't be blank")
    end

    # 7. preparation_dayが空では登録できないこと
    it "is invalid without a preparation_day" do
      item.valid?
      expect(item.errors[:preparation_day]).to include("can't be blank")
    end
  end
end