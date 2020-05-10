class GossipsController < ApplicationController

  def index
  end

  def show
    @gossip = Gossip.find(params[:id])

  end

  def new
    @gossip = Gossip.new
  end


  def create
     @gossip = Gossip.new(title: params[:title],
       content: params[:content],  user: User.find(params[:user]))
       if @gossip.save
         flash[:success] = "The Gossip was successfuly created"
           redirect_to gossips_path
       else render 'new'
  end
end

def edit
    @gossip = Gossip.find(params[:id])
end

def update
    @gossip = Gossip.find(params[:id])
    gossip_params =  params.require(:gossip).permit(:title, :content, :user)
    if @gossip.update(gossip_params)
      flash[:success] = "The Gossip was successfuly updated"
    redirect_to gossips_path
  end
end

def destroy
  @gossip = Gossip.find(params[:id])
@gossip.destroy
redirect_to gossips_path
end


private

def gossip_params
    return params.require(:gossip).permit(:title, :content, :user)
end
end
