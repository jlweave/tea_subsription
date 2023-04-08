require 'rails_helper'

describe "Subscription API" do
  it "sends a list of subscriptions" do
    subscription = create_list(:subscription, 3)

    get '/api/v1/subscriptions'

    expect(response).to be_successful
    subscriptions = JSON.parse(response.body, symbolize_names: true)

    expect(subscriptions.count).to eq(3)    

    subscriptions.each do |subscription|
      expect(subscription).to have_key(:id)
      expect(subscription[:id]).to be_an(Integer)

      expect(subscription).to have_key(:title)
      expect(subscription[:title]).to be_a(String)

      expect(subscription).to have_key(:price)
      expect(subscription[:price]).to be_a(Integer)

      expect(subscription).to have_key(:status)
      expect(subscription[:status]).to be_a(String)

      expect(subscription).to have_key(:fequencey)
      expect(subscription[:fequencey]).to be_a(String)
    end    
  end
end