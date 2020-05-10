class GossipsController < ApplicationController

  # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
  def index
  end

  # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
  def show
    @gossip = Gossip.find(params[:id])

  end

  # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  def new
    @gossip = Gossip.new
  end

  # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur

  def create
     @gossip = Gossip.new(title: params[:title],
       content: params[:content],  user: User.find(params[:user]))
       if @gossip.save
         flash[:success] = "The Gossip was successfuly created"
           redirect_to gossips_path
       else render 'new'
  end
end

# Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
def edit
    @gossip = Gossip.find(params[:id])
end

# Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
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
