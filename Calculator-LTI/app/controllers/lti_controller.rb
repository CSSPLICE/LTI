class LtiController < ApplicationController
  after_action :allow_iframe, only: [:launch]
  def launch
    #Check if the key is present or not
    if not Rails.configuration.lti_settings[params[:oauth_consumer_key]]
      render :launch_error, status: 401
      return
    end
    require 'oauth/request_proxy/action_controller_request'
    @provider = IMS::LTI::ToolProvider.new(
      params[:oauth_consumer_key],
      Rails.configuration.lti_settings[params[:oauth_consumer_key]],
      params
    )

    if not @provider.valid_request?(request)
      # the request wasn't validated
      render :launch_error, status: 401
      return
    end

    #Request was valid, create a session for a user
    session[:user_id] = params.require :user_id
    session[:lis_person_name_full] = params.require :lis_person_name_full

    @lis_person_name_full = session[:lis_person_name_full]
    redirect_to calculator_path
  end
  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end
end
