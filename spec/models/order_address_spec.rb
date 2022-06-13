require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
    sleep 0.3
  end

  describe "購入情報の保存" do
    context "保存できる場合" do
      it "全て入力されていれば保存できる" do
        expect(@order_address).to be_valid
      end
      it "building_nameが空でも保存できる" do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end
    context "保存できない場合" do
      it "tokenが空では保存できない" do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it "post_codeが空では保存できない" do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it "post_codeに「-」がなければ保存できない" do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid")
      end
      it "prefecture_idが空では保存できない" do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "municipalityが空では保存できない" do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it "addressが空では保存できない" do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空では保存できない" do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberに「-」があると保存できない" do
        @order_address.phone_number = '090-0000-0000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "userが紐付いていなければ保存できない" do
        @order_address.user_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it "itemが紐付いていなければ保存できない" do
        @order_address.item_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
