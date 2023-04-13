require 'rails_helper'

describe 'Subscription API' do
  describe 'all subscriptions' do
    before(:each) do
      @customers = create_list(:customer, 2)
      @teas = create_list(:tea, 6)
      @subscription1 = create(:subscription, customer_id: @customers.first.id)
      @subscription2 = create(:subscription, customer_id: @customers.last.id)
    end

    it 'sends a list of subscriptions' do
      customer = {
        'customer_id': @customers.first.id
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      get api_v1_customer_subscriptions_path(customer), headers: headers

      expect(response).to be_successful
      subscriptions = JSON.parse(response.body, symbolize_names: true)

      expect(subscriptions.count).to eq(1)

      subscriptions[:data][:subscriptions].each do |subscription|
    
        expect(subscription).to have_key(:id)
        expect(subscription[:id]).to be_an(Integer)

        expect(subscription).to have_key(:title)
        expect(subscription[:title]).to be_a(String)

        expect(subscription).to have_key(:price)
        expect(subscription[:price]).to be_a(Integer)

        expect(subscription).to have_key(:status)
        expect(subscription[:status]).to be_a(String)

        expect(subscription).to have_key(:frequency)
        expect(subscription[:frequency]).to be_a(String)
      end
    end
  end

  describe 'create' do
    before(:each) do
      @customers = create_list(:customer, 2)
      @teas = create_list(:tea, 6)
      @subscription1 = create(:subscription, customer_id: @customers.first.id)
      @subscription2 = create(:subscription, customer_id: @customers.last.id)
    end

    it 'create a new subscription' do
      sub_params = {
        'title': @teas.first.title,
        'price': 10.25,
        'status': 'Active',
        'frequency': 'Annually',
        'tea_id': @teas.first.id,
        'customer_id': @customers.first.id
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post api_v1_customer_subscriptions_path(@customers.first.id), headers: headers, params: JSON.generate(sub_params)

      subscription = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(subscription).to have_key(:id)
      expect(subscription[:id]).to be_an(Integer)

      expect(subscription).to have_key(:title)
      expect(subscription[:title]).to be_a(String)

      expect(subscription).to have_key(:price)
      expect(subscription[:price]).to be_a(Integer)

      expect(subscription).to have_key(:status)
      expect(subscription[:status]).to be_a(String)

      expect(subscription).to have_key(:frequency)
      expect(subscription[:frequency]).to be_a(String)
    end
  end

  describe 'updates' do
    before(:each) do
      @customers = create_list(:customer, 2)
      @teas = create_list(:tea, 6)
      @subscription1 = create(:subscription, customer_id: @customers.first.id)
      @subscription2 = create(:subscription, customer_id: @customers.last.id)
    end

    it 'update and show all customers subscriptions' do
      sub_params = {
        'id': @subscription1.id,
        'title': @teas.first.title,
        'price': 10,
        'status': 'cancelled',
        'frequency': 'Annually',
        'tea_id': @teas.first.id,
        'customer_id': @customers.first.id
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      patch api_v1_customer_subscription_path(@customers.first.id, @subscription1.id), headers: headers, params: JSON.generate(sub_params)

      subscription = JSON.parse(response.body, symbolize_names: true)[:data]
      
# require 'pry'; binding.pry
      expect(subscription).to have_key(:id)
      expect(subscription[:id]).to be_an(Integer)

      expect(subscription).to have_key(:title)
      expect(subscription[:title]).to be_a(String)

      expect(subscription).to have_key(:price)
      expect(subscription[:price]).to be_a(Integer)

      expect(subscription).to have_key(:status)
      expect(subscription[:status]).to be_a(String)
      expect(subscription[:status]).to eq("cancelled")

      expect(subscription).to have_key(:frequency)
      expect(subscription[:frequency]).to be_a(String)
    end
  end
end
