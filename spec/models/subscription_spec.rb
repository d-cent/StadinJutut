require 'spec_helper'

describe Subscription do
  describe "obfuscated" do
    let(:subscription) { Subscription.create!(terms: ['bicycle', 'police'], email: 'joonas@example.fi') }

    it "should generate an obfuscated hashed id" do
      subscription.hashed_id.length.should == 40
    end

    it "should by findable by its hashed id" do
      subscription.should == Subscription.find_securely(subscription.hashed_id)
    end
  end
end