class TaxCalculator
  extend LightService::Organizer

  def self.call(promo:, state:, tax_exempt:, subtotal:)
    with(
      promo: promo,
      state: state,
      tax_exempt: tax_exempt,
      subtotal: subtotal
    ).reduce(actions)
  end

  def self.actions
    [
      ::Actions::DeterminePromoValue,
      ::Actions::DetermineInterimTotal,
      ::Actions::FindStateTaxRates,
      ::Actions::DetermineTaxes,
      ::Actions::DetermineTotal
    ]
  end
end
