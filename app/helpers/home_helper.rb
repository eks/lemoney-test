module HomeHelper
  def premium_badge(offer)
    if offer.premium
      tag.div(class: 'float-right') do |tag|
        tag.span(class: 'badge badge-danger') do
          'premium'
        end
      end
    end
  end

  def card_btn(offer)
    tag.a(
      class: offer.premium ? 'btn btn-success btn-lg' : 'btn btn-primary',
      href: offer.url
    ) do
      'Shop now'
    end
  end
end
