class StaticPagesController < ApplicationController
    def home
        @user = params[:first_name]
      end
    
      def team
      end
    
      def contact
      end
    
      def gossip
        @gossips = Gossip.find(params[:gossip_id])
      end
    
      def gossips
        @gossips = Gossip.all
        render :layout => nil

      end 
    
    
      def user
        @user = User.find(params[:user_id])
        @gossips_user = Gossip.where(user: @user)
      end 
    
end
