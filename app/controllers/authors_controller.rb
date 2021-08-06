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
      @user = User.new(post_params)
      # @user = User.new(first_name: params[:first_name],
      #   email: params[:email],
      #   password: params[:password],
      #   age: params[:age],
      #   city_id: params[:city_id])
      if @user.save 
        redirect_to user_path(user.id), notice: "User créé"
      else
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
  post_params = params.permit(:first_name, :last_name, :description, :city_id, :email, :age, :password)
end

def authenticate_user
  if session[:user_id] == nil
    redirect_to new_session_path
  end 
end 

end