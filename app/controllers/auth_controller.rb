class AuthController < ApplicationController

    protect_from_forgery unless: -> { request.format.json? }

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      
      render json:  user
    else
      render json: { error: 'Username or Password does not exist.'}
    end



  end
end