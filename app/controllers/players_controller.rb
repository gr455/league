class PlayersController < ApplicationController
	def index #corrtemp corresponds a template
		@players=Player.all
		#@team=Team.all
	end

	def new #corrtemp
	end

	def create

		p=Player.new
		p_params=player_params
		p.name= p_params[:name]
		p.lastname= p_params[:lastname]
		p.age=p_params[:age]
		p.team_id= Team.find_by(name: p_params[:team]).id
		@team_id=p.team_id

		if p.save
			redirect_to "/players"
		else
			flash[:errors]=p.errors.full_messages
			redirect_to "/players/new"
		end
	end

	def update #corrtemp
		@player=Player.find(params[:id]) #you require players.id in the method of the template. params[:id] got from routes
	end

	def doUpdate
		p=Player.find(params[:id])
		p_params=player_params
		p_params[:team_id]=Team.find_by(name: params[:player][:team]).id
		p_params.delete(:team) # :team was interfering with the player_params for the update method
		puts p_params
		puts "LOOK UP"
		if p.update(player_params)
			redirect_to	"/players"
		end
	end

	private
		def player_params
			params.require(:player).permit!
		end
	
end
