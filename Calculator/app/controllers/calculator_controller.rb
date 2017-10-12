class CalculatorController < ApplicationController
  after_action :allow_iframe, only: [:calculator]
  def index
  end
  def calculator
  end
  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end
end
