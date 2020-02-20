class Actions::FindStateTaxRates
  extend LightService::Action

  expects :state
  promises :tax_rate

  executed do |context|
    context.tax_rate = StateTaxRates::ALL_RATES[context.state]
    next if context.tax_rate.present?
    context.fail_and_return!(
      "Tax rate not found",
      error_code: 12345678
    )
  end
end
