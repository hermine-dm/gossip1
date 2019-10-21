require 'gossip'
require 'view'

class Controller
	attr_accessor :gossip, :view, :gossips 

	def initialize
		@view = View.new
	end

	def create_gossip
		params = @view.create_gossip
		@gossip = Gossip.new(params.values[1],params.values[0]).save
	end

	def index_gossips
		@gossips = Gossip.all
		@view.index_gossips(@gossips)
	end

	def destroy
		@gossips = Gossip.all
		@view.menu(@gossips)
		params = @view.destroy(@gossips)
		Gossip.destroy(params.values[1],params.values[0])
		puts "Voici la nouvelle liste :"
		index_gossips()
	end
end