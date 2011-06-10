class Parish < ActiveRecord::Base
  has_many :masses, :dependent => :destroy
  acts_as_gmappable
  
  def gmaps4rails_address
    "#{self.address}, #{self.city}, #{self.state} #{self.zip}, USA"
  end
  
  def gmaps4rails_infowindow
    # add here whatever html content you desire, it will be displayed when users clicks on the marker
    "<h2>#{self.name}</h2><div class='address'>#{self.address}<br>#{self.city}, #{self.state} #{self.zip}</div>"
  end
  
  def gmaps4rails_title
    #text only
    self.name
  end
  
  def gmaps4rails_sidebar
    #html goes here
    "#{self.name}"
  end
end
