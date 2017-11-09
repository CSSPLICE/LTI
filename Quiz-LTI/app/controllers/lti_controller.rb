class LtiController < ApplicationController
  after_action :allow_iframe, only: [:launch]
  def launch
    #If set, then hide the header and footer
    session[:isLTI]=true
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
      render :launch_error, status: 401
      return
    end
    @@launch_params=params;
    email = params[:lis_person_contact_email_primary]

    #Request was valid, Now create a new user if the user does not exist
    @user = User.where(email: email).first
    if @user.blank?
      @user = User.new(:username => email,
                       :email => email,
                       :password => email,
                       :password_confirmation => email)
      if !@user.save
        puts @user.errors.full_messages.first
      end
    end
    #Login the user and create his session.
    authorized_user = User.authenticate(email,email)
    session[:user_id] = authorized_user.id
    #redirect the user to give quiz starting from question id 1
    redirect_to(:controller => "questions", :action => "show", :id => 1)
  end

  def submitscore
    @tp = IMS::LTI::ToolProvider.new(@@launch_params[:oauth_consumer_key],
    Rails.configuration.lti_settings[@@launch_params[:oauth_consumer_key]],
    @@launch_params)
    # add extension
    @tp.extend IMS::LTI::Extensions::OutcomeData::ToolProvider

    if !@tp.outcome_service?
      @message = "This tool wasn't lunched as an outcome service"
      puts "This tool wasn't lunched as an outcome service"
      render(:launch_error)
    end

    res = @tp.post_extended_replace_result!(score: params[:result])

    if res.success?
      puts "Score Submitted"
    else
      puts "Error during score submission"
    end
    redirect_to @@launch_params[:launch_presentation_return_url]
  end

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end
end
