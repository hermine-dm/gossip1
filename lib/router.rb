require 'controller'


class Router
	attr_accessor :controller

	def initialize
		puts "ok"
		@controller = Controller.new
	end

	def perform
		while true
			menu()
			params = gets.chomp.to_i
		    case params
		    when 1 
		    	puts "Tu as choisi de créer un gossip" 
       			@controller.create_gossip
		    when 2
		    	puts "Tu as choisi d'afficher les potins"
		    	@controller.index_gossips
		    when 3 
		    	puts "Tu as choisi de détruire un potin, malin!"
		    	@controller.destroy
		    when 4 
		    	puts "À bientôt !"
        		break #Ce "break" permet de sortir de la boucle while. C'est même la seule façon d'en sortir.
		    else
		    	puts "Error: ce choix n'existe pas"
		    end
		end
	end

	def menu 
		puts "Tu veux faire quoi ?"
	    puts "1. Je veux créer un gossip"
	    puts "2. Afficher tous les potins"
	    puts "3. Supprimer un potin"
	    puts "4. Je veux quitter l'app"
    end
end 