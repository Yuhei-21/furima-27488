require 'rails_helper'

describe Item do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: user.id)
    end
    # 1.nameが空では登録できないこと
    it "is invalid without a name" do
      @item.name = ""
      @item.valid?
      expect(@item.errors[:name]).to include("can't be blank")
    end

    # 2. item_explanationが空では登録できないこと
    it "is invalid without a item_explanation" do
      @item.item_explanation = ""
      @item.valid?
      expect(@item.errors[:item_explanation]).to include("can't be blank")
    end

    # 3. categoryが空では登録できないこと
    it "is invalid without a category_id" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors[:category_id]).to include("can't be blank")
    end

    # 4. conditionが空では登録できないこと
    it "is invalid without a condition_id" do
      @item.condition_id = ""
      @item.valid?
      expect(@item.errors[:condition_id]).to include("can't be blank")
    end

    # 5. postage_payerが空では登録できないこと
    it "is invalid without a postage_payer" do
      @item.postagepayer_id = ""
      @item.valid?
      expect(@item.errors[:postagepayer_id]).to include("can't be blank")
    end

    # 6. postage_typeが空では登録できないこと
    it "is invalid without a postage_type" do
      @item.postagetype_id = ""
      @item.valid?
      expect(@item.errors[:postagetype_id]).to include("can't be blank")
    end

    # 7. preparation_dayが空では登録できないこと
    it "is invalid without a preparation_day" do
      @item.preparationday_id = ""
      @item.valid?
      expect(@item.errors[:preparationday_id]).to include("can't be blank")
    end

    # 8. priceが300以上であれば登録できること
    it "is valid with a price that has more than 300 characters " do
      expect(@item).to be_valid
    end

    # 9. priceが100000000以上であれば登録できないこと
    it "is invalid with a price that has less than 100000000 characters " do
      @item.price = 100000000
      @item.valid?
      expect(@item.errors[:price]).to include("is not included in the list")
    end

    # 10. priceが300以下であれば登録できないこと
    it "is invalid with a price that has less than 300 characters " do
      @item.price = 299
      @item.valid?
      expect(@item.errors[:price]).to include("is not included in the list")
    end
  end
end