class HomeController < ApplicationController
  def index
    @offers = Offer.active.order("premium desc")
  end
end
