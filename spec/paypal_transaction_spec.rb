require './spec/spec_helper'

describe PaypalTransaction do
  context "parsing params" do
    it "should return only params in db" do
      params = {"mc_handling1"=>"1.67", "address_state"=>"CA", "txn_id"=>"767026130", "last_name"=>"Badarse", "mc_currency"=>"USD", "payer_status"=>"verified", "address_status"=>"confirmed", "tax"=>"2.02", "invoice"=>"abc1234", "address_street"=>"123, any street", "payer_email"=>"buyer@paypalsandbox.com", "mc_gross1"=>"12.34", "mc_shipping"=>"3.02", "first_name"=>"Betty", "business"=>"seller@paypalsandbox.com", "verify_sign"=>"AltbaYkTK.66H6ibamZstajnz5jrA2pgZvZ6xXUDlxGxVMVWbF1x5DwZ", "payer_id"=>"TESTBUYERID01", "payment_date"=>"11:20:35 8 Aug 2013 PDT", "address_country"=>"United States", "payment_status"=>"Completed", "receiver_email"=>"seller@paypalsandbox.com", "payment_type"=>"instant", "address_zip"=>"95131", "address_city"=>"San Jose", "mc_shipping1"=>"1.02", "item_name1"=>"something", "mc_gross"=>"15.34", "item_number1"=>"AK-1234", "mc_fee"=>"0.44", "residence_country"=>"US", "address_country_code"=>"US", "notify_version"=>"2.4", "receiver_id"=>"seller@paypalsandbox.com", "mc_handling"=>"2.06", "txn_type"=>"cart", "custom"=>"xyz123", "address_name"=>"John Smith", "test_ipn"=>"1"}
      transaction = PaypalTransaction.new(params).filter_paypal_post(params)
      expect(transaction).to_not include("txn_id")
      expect(transaction).to include("last_name")

    end

    xit "should exercise" do
      params = {"mc_handling1"=>"1.67", "address_state"=>"CA", "txn_id"=>"767026130", "last_name"=>"Badarse", "mc_currency"=>"USD", "payer_status"=>"verified", "address_status"=>"confirmed", "tax"=>"2.02", "invoice"=>"abc1234", "address_street"=>"123, any street", "payer_email"=>"buyer@paypalsandbox.com", "mc_gross1"=>"12.34", "mc_shipping"=>"3.02", "first_name"=>"Betty", "business"=>"seller@paypalsandbox.com", "verify_sign"=>"AltbaYkTK.66H6ibamZstajnz5jrA2pgZvZ6xXUDlxGxVMVWbF1x5DwZ", "payer_id"=>"TESTBUYERID01", "payment_date"=>"11:20:35 8 Aug 2013 PDT", "address_country"=>"United States", "payment_status"=>"Completed", "receiver_email"=>"seller@paypalsandbox.com", "payment_type"=>"instant", "address_zip"=>"95131", "address_city"=>"San Jose", "mc_shipping1"=>"1.02", "item_name1"=>"something", "mc_gross"=>"15.34", "item_number1"=>"AK-1234", "mc_fee"=>"0.44", "residence_country"=>"US", "address_country_code"=>"US", "notify_version"=>"2.4", "receiver_id"=>"seller@paypalsandbox.com", "mc_handling"=>"2.06", "txn_type"=>"cart", "custom"=>"xyz123", "address_name"=>"John Smith", "test_ipn"=>"1"}
      transaction = PaypalTransaction.new(params).extract_params_for_initialize(params)
      p transaction
    end

    xit "should find item name in params hash" do
      params = {"item_name1" => "42"}
      out = capture_stdout do
        transaction = PaypalTransaction.new(params).filter_cart_items(params)
      end
      expect(out).to match(/item_name1/)
      expect(out).to_not match(/item_number1/)
    end
  end
end