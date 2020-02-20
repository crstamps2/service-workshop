class Actions::DetermineTotal
  extend LightService::Action

  expects :taxes, :interim_total
  promises :total

  executed do |context|
    context.total = context.interim_total + context.taxes
  end
end
