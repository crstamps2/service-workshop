class Actions::DeterminePromoValue
  extend LightService::Action

  expects :promo
  promises :promo_value

  executed do |context|
    context.promo_value = Promos::ALL_PROMOS[context.promo] || 0
  end
end
