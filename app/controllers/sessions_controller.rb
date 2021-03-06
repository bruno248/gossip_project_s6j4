class SessionsController < ApplicationController

  def new
  end

  def create
  user = User.find_by(email:params[:email]) # cherche s'il existe un utilisateur en base avec l’e-mail
  # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(params[:password]) #(params.require(:session).permit(:password))
      session[:user_id] = user.id 
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end

  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path
  end

end
