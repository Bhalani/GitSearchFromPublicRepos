# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :http_authenticate

  private

  def http_authenticate
    return true if Rails.env.production?

    authenticate_or_request_with_http_basic do |username, password|
      username == 'Hiren' && password == 'password'
    end
  end
end
