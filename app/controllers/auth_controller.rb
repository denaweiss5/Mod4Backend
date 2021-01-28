class AuthController < ApplicationController

    protect_from_forgery unless: -> { request.format.json? }

  def create
    user = User.find_by(username: params[:username])
 
    
    if user && user.authenticate(params[:password])
      # paylod = { user_id: user.id }
      # hmac_secret: my_secret
      # token = JWT.encode(payload, hmac_secret, HS256)
      render json: user
      # render json: { user: UserSerializer.new(user), token: token }
    else
      render json: { error: 'Username or Password does not exist.'}
    end



  end
end