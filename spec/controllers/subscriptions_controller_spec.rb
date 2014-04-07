require 'spec_helper'

describe SubscriptionsController do
  describe "GET #show" do
    it "assigns the obfuscated subscription to @subscription" do
      subscription = Subscription.create!(terms: ['bicycle', 'police'], email: 'joonas@example.fi')
      get :show, id: subscription
      assigns(:subscription).should eq(subscription)
    end
  end
  
  describe "GET #new" do
    it "assigns a new subscription to @subscription" do
      get :new
    end
  end
  
  describe "POST create" do
    context "with valid attributes" do
      it "creates a new subscription" do
        expect {
          post :create, subscription: { term_list: 'bicycle, police', email: 'joonas@example.fi' }
        }.to change(Subscription, :count).by(1)
      end
      it "redirects to the new subscription" do
        post :create, subscription: { term_list: 'bicycle, police', email: 'joonas@example.fi' }
        response.should redirect_to Subscription.last
      end
    end
    
    context "with invalid attributes" do
      it "does not create a new subscription" do
        expect {
          post :create, subscription: { term_list: '', email: '' }
        }.to_not change(Subscription, :count)
      end
      it "re-renders the new action" do
        post :create, subscription: { term_list: '', email: '' }
        response.should render_template :new
      end
    end
  end
end