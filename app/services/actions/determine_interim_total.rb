class Actions::DetermineInterimTotal
  extend LightService::Action

  expects :promo_value, :subtotal
  promises :interim_total

  executed do |context|
    context.interim_total = context.subtotal - context.promo_value
  end
end
