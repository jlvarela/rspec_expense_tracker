# frozen_string_literal: true

require "rack/test"
require "json"
require_relative "../../app/api"

def app
  ExpenseTracker::API.new
end

RSpec.describe "Expense Tracker Api" do
  include Rack::Test::Methods

  it "record submitted expenses" do
    coffee = {
      "payee" => "Starbucks",
      "amount" => 5.75,
      "date" => "2017-06-10"
    }

    post "/expenses", JSON.generate(coffee)
  end
end
