class Artist 
    attr_accessor :name, :songs 
    extend Concerns::Findable
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
   
  end 
  
  def self.all 
    @@all
  end 
  
  def save
    @@all << self
  end 
  
  def self.destroy_all 
    @@all.clear 
  end 
  
   def self.create(artist) 
   new(artist).tap{|artist|artist.save}
 end 
 

 
 def add_song(song) 
    if song.artist == nil 
      song.artist = self 
    end 
    
    if !self.songs.include?(song)
      self.songs << song
  end
end  

 def songs 
   @songs 
 end
 
 def genres  
 self.songs.collect{|song|song.genre}.uniq
end 
  
end 