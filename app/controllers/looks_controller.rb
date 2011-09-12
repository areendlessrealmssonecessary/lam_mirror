class LooksController < ApplicationController
	def list
		@list = Look.all
	end
	def view
		@data = Look.where("lid=#{params[:lid]}").limit(1).first
	end
end
