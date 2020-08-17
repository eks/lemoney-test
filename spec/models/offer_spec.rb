# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Offer, type: :model do
  describe '#validations' do
    it 'have valid factory' do
      offer = build(:offer)
      expect(offer).to be_valid
    end

    it 'is not valid without advertiser name' do
      offer = build(:offer, advertiser_name: nil)
      expect(offer).to be_invalid
      expect(offer.errors.messages[:advertiser_name]).to include("can't be blank")
    end

    it 'is not valid without url' do
      offer = build(:offer, url: nil)
      expect(offer).to be_invalid
      expect(offer.errors.messages[:url]).to include("can't be blank")
    end

    it 'is not valid without description' do
      offer = build(:offer, description: nil)
      expect(offer).to be_invalid
      expect(offer.errors.messages[:description]).to include("can't be blank")
    end

    it 'is not valid without starts_at' do
      offer = build(:offer, starts_at: nil)
      expect(offer).to be_invalid
      expect(offer.errors.messages[:starts_at]).to include("can't be blank")
    end

    it 'is not valid if ends_at is after starts_at' do
      offer = build(:offer, ends_at: Date.today, starts_at: Date.today + 3.days)
      expect(offer).to be_invalid
      expect(offer.errors.messages[:ends_at]).to include("must be after the start date")
    end

    it 'is valid if ends_at is nil' do
      offer = build(:offer, ends_at: nil)
      expect(offer).to be_valid
    end

    it 'is invalid with not uniq advertiser_name' do
      offer = create(:offer)
      other_offer = build(:offer, advertiser_name: offer.advertiser_name)

      expect(other_offer).to be_invalid
      expect(other_offer.errors.messages[:advertiser_name]).to include("has already been taken")
    end

    it 'is invalid with too long description' do
      offer = build(:offer, description: (0...501).map { rand(9) }.join)
      expect(offer).to be_invalid
      expect(offer.errors.messages[:description]).to include("is too long (maximum is 500 characters)")
    end
  end
end
