class AuthorsController < ApplicationController
  def index
    @users = User.all 
    end
  
    def show
    @user = User.find(params[:id])
    end
  
    def new
    @user = User.new
    end
  
    def create
      # user = User.create(post_params)
      # redirect_to user_path(user.id)
      @user = User.new(post_params)
      if @user.save # essaie de sauvegarder en base @gossip
        redirect_to user_path(user.id), notice: "Gossip créé"
      else
        # sinon, il render la view new (qui est celle sur laquelle on est déjà)
        render :new
      end  
    end
  
    def edit
    @user = User.find(params[:id])
    end
  
    def update
    @user = User.find(params[:id])
    @user.destroy
    redirect_to categories_path
    end
  
    def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
    end

private

def post_params
  post_params = params.permit(:first_name, :last_name, :email, :age, :password )
end

def authenticate_user
  if session[:user_id] == nil
    redirect_to new_session_path
  end 
end 

end