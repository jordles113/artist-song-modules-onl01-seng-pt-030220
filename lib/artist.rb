require 'pry'

class Artist
  attr_accessor :name	  attr_accessor :name
  attr_reader :songs	  attr_reader :songs


  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  extend Findable
  include Paramable

  @@artists = []	  @@artists = []


  def initialize	  def initialize
    @@artists << self	    # @@artists << self
    # self.class.all << self will be replaced by super
    super
    @songs = []	    @songs = []
  end	  end


  def self.find_by_name(name)	  # def self.find_by_name(name)
    @@artists.detect{|a| a.name == name}	  #   @@artists.detect{|a| a.name == name}
  end	  # end


  def self.all	  def self.all
    @@artists	    @@artists
  end	  end


  def self.reset_all	  # def self.reset_all
    self.all.clear	  #   self.all.clear
  end	  # end


  def self.count	  # def self.count
    self.all.count	  #   self.all.count
  end	  # end


  def add_song(song)	  def add_song(song)
    @songs << song	    @songs << song
@@ -36,7 +43,7 @@ def add_songs(songs)
    songs.each { |song| add_song(song) }	    songs.each { |song| add_song(song) }
  end	  end


  def to_param	  # def to_param
    name.downcase.gsub(' ', '-')	  #   name.downcase.gsub(' ', '-')
  end	  # end
end	end