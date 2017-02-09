require "pry"

class Artist
	attr_accessor :name, :songs
	

	# @songs = []
	@@all = []
	
	def initialize(name)

		@name = name
		@songs = []
	end

	def name=(name)
		@name = name
	end

	def add_song(song)
		@songs << song
	end

	# def songs
	# 	@songs
	# end

	def save
		@@all << self
	end

	def self.all
		@@all
	end

	def search_all

	end

	def self.find_or_create_by_name(name)

		test = @@all.map {|artist| artist.name}.find_index(name)

		if test == nil
			artist = Artist.new(name)
			artist.save
			artist 
		else
			@@all[test]
		end

	end

	def print_songs
		
		@songs.each do |song| 
			# if song.artist == self
				puts song.name
			# end
		end
	end


end
