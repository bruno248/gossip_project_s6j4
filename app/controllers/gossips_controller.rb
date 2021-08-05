class GossipsController < ApplicationController

  before_action :authenticate_user    #, only: [:index]


    def index
      @gossips = Gossip.all 
    end
  
    def show
      @gossip = Gossip.find(params[:id])
      @date = @gossip.created_at.to_date
    end
  
    def new
    @gossip = Gossip.new
    end
  
    def create #fonction mais pas html
      #  user = User.where(first_name: params[:user_name]).first
      #  user != nil ? user = user.id : user = ""
       @gossip = Gossip.new(title: params[:title],
        content: params[:content],
        user_id: session[:user_id].to_i)
      if @gossip.save # essaie de sauvegarder en base @gossip
        redirect_to gossip_path(@gossip), notice: "Gossip créé"
      else
        render :new
      end  
    end
  
    def edit
    @gossip = Gossip.find(params[:id])
    # if User.find(session[:user_id]).id != @gossip.user_id
    #   redirect_to gossip_path, flash: { error: "désolé il faut que tu sois l'auteur pour pouvoir le modifier" }
    # end
    end
  
    def update #fonction mais pas html
    @gossip = Gossip.find(params[:id])
    if @gossip.update(params.permit(:title, :content, :user_id))
      redirect_to gossip_path(@gossip), notice: "Gossip mis à jour"
    else
      render :edit
    end
    end

    def destroy #fonction mais pas html
        @gossip = Gossip.find(params[:id])
        # if User.find(session[:user_id]).id != @gossip.user_id
    #   redirect_to gossip_path, flash: { error: "désolé il faut que tu sois l'auteur pour pouvoir le détruire" }
    #else
    @gossip.destroy
    redirect_to root, notice: "Gossip détruit"
    #end
    end
  

  private
  
    def post_params
      post_params = params.require(:gossip).permit(:title, :content)
    end

    def authenticate_user
      if session[:user_id] == nil
        redirect_to new_session_path
      end
    end


  end