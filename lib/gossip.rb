
require "csv"

class Gossip
	attr_accessor :author, :content

	def initialize(author, content)
		@author = author
		@content = content
	end	

	def save
		CSV.open("/home/hermine/Documents/THP2/semaine3/vendredi/gossip/db/gossip.csv", "a") do |csv|
  			csv << [@author, @content]
		end
	end

	def self.all
		all_gossips = []
		  # 2)chaque ligne de ton 
		CSV.foreach("/home/hermine/Documents/THP2/semaine3/vendredi/gossip/db/gossip.csv") do |ligne|
    		gossip_provisoire = Gossip.new(ligne[0],ligne[1]) #- permet de créer un objet gossip
    		all_gossips << gossip_provisoire #- permet de rajouter le gossip provisoire au array
  		end

  		return all_gossips #- on renvoie le résultat

	end

	def self.destroy(author, content)
		gossip_csv = CSV.table("/home/hermine/Documents/THP2/semaine3/vendredi/gossip/db/gossip.csv")
		gossip_csv.delete_if{|row| row[:auteur] == author && row[:content] == content}
		File.open("/home/hermine/Documents/THP2/semaine3/vendredi/gossip/db/gossip.csv", 'w') do |f|
  			f.write(gossip_csv.to_csv)
		end
	end
end