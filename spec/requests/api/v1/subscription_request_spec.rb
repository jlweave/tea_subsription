require 'rails_helper'

describe "Subscription API" do
  it "sends a list of subscriptions" do
    # create(:tea)
    # create(:customer)
    # create_list(:subscription, 3)

    get '/api/v1/subscriptions'

    expect(response).to be_successful
  end
end