FactoryBot.define do
  factory :offer do
    advertiser_name {'Advertiser Name'}
    url {'http://some.url.com'}
    description {'A little description'}
    starts_at {Date.today}
    ends_at {Date.today + 3.days}
    premium {true}
  end
end
