class Card
	attr_accessor :rank, :suit

	def initialize(rank, suit)
		@rank = rank
		@suit = suit
	end

	def output_card
		puts "#{@rank} of #{@suit}"
	end

	def self.random_card
		Card.new(rand(10), :spades)
	end
end

class Deck
	def initialize
		@cards = []
		[*(1..10), "Ace", "Jack", "Queen", "King"].each do |y|
			@cards << Card.new(y, :spades)
			@cards << Card.new(y, :diamonds)
			@cards << Card.new(y, :clubs)
			@cards << Card.new(y, :hearts)
		end
	end

	def shuffle
		@cards.shuffle!
	end

	def deal
		puts @cards.shift.output_card
	end
end

deck = Deck.new
deck.shuffle
10.times { deck.deal }
