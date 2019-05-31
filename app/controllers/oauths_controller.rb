class OauthsController < ApplicationController
  skip_before_action :require_login

  def oauth
    login_at(params[:provider])
  end

  def callback
    # provider = params[:provider]
    if @user = login_from(params[:provider])
      redirect_to root_path, notice: "Logged in from #{params[:provider].titleize}!"
    else
      begin
        @user = create_from(params[:provider])

        reset_session
        auto_login(@user)
        redirect_to root_path, notice: "Logged in from #{params[:provider].titleize}!"
      rescue StandardError
        redirect_to root_path, alert: "Failed to login from #{params[:provider].titleize}!"
      end
    end
  end

  # def callback
  #   byebug
  #   provider = params[:provider]
  #   if @user = login_from(provider)
  #     byebug
  #     redirect_to root_path, notice: "Logged in from #{provider.titleize}!"
  #   else
  #     begin
  #       byebug
  #       @user = create_from(provider)

  #       reset_session
  #       auto_login(@user)
  #       byebug
  #       redirect_to root_path, notice: "Logged in from #{provider.titleize}!"
  #     rescue StandardError
  #       byebug
  #       redirect_to root_path, alert: "Failed to login from #{provider.titleize}!"
  #     end
  #   end
  # end

  private

  def auth_params
    params.permit(:code, :provider, :scope)
  end
end
