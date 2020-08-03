require 'rails_helper'

describe Flight, type: :model do
  describe "validations" do
    it { should validate_presence_of :number }
    it { should validate_presence_of :departure }
    it { should validate_presence_of :arrival }
    it { should validate_presence_of :time }
    it { should validate_presence_of :date }
  end

  describe "relationships" do
    it { should belong_to :airline }
    it { should have_many :passenger_flights }
    it { should have_many :passengers, through: :passenger_flights }
  end
end
