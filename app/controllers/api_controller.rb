class ApiController < ActionController::Base
  skip_before_action :verify_authenticity_token

  # before_create :authenticate_user_from_token!
  #
  # def authenticate_user_from_token!
  #   if params[:auth_token].present?
  #     user = User.find_by_authentication_token(params[:auth_token]
  #
  #      sign_in(user, store: false) if user
  #   end
  # end

 before_action :authenticate_user_from_token!

  def authenticate_user_from_token!

    if params[:auth_token].present?
      user = User.find_by_authentication_token( params[:auth_token] )

      # sign_in 是 Devise 的方法，会设定好 current_user
      sign_in(user, store: false) if user
    end
  end
end
