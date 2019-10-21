
class View

	def create_gossip
		params = {}
		print "l'auteur STP > "
		author_user = gets.chomp
		print "\net enfin le contenu du gossip... > "
		content_user = gets.chomp
		puts "C'est noté, ca restera entre nous!\n"
		return params = {content: content_user, author: author_user}
	end

	def index_gossips(gossips)
		puts "-"*20
		for i in 1...gossips.size
			puts "L'auteur est #{gossips[i].author} et son contenu est #{gossips[i].content}"	
		end
		puts "-"*20
	end

	def menu(gossips)
		for i in 1...gossips.size
			print "Tapez #{i} pour supprimer le gossip suivant : "
			puts "L'auteur est #{gossips[i].author} et son contenu est #{gossips[i].content}"	
		end
	end

	def destroy(gossips)
		number_user = gets.chomp.to_i
		params = {}
		for i in 1..gossips.size
			if i = number_user
				params = {content: gossips[i].content, author: gossips[i].author}
			end
		end
		puts params
		return params
	end
end