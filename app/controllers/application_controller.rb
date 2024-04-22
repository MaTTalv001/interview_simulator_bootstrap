class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

  helper_method :current_user, :user_signed_in?

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    current_user.present?
  end

  def authenticate_user!
    unless user_signed_in?
      redirect_to root_path, alert: 'ログインが必要です。'
    end
  end
end
