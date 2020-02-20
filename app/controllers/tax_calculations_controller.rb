class TaxCalculationsController < ApplicationController
  def new
  end

  def create
    result = TaxCalculator.call(
      promo: params.fetch(:promo),
      subtotal: params.fetch(:subtotal).to_i,
      state: params.fetch(:state),
      tax_exempt: params[:tax_exempt].present?
    )
    if result.success?
      @subtotal = result.subtotal
      @total = result.total
      @promo_value = result.promo_value
      @taxes = result.taxes
    else
      flash.message = result.message
      render :new
    end
  end
end
