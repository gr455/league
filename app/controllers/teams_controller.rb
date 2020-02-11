class TeamsController < ApplicationController
	def showTeams
		@teams=Team.all
	end
end
