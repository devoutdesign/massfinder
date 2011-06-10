class Parish < ActiveRecord::Base
  has_many :masses, :dependent => :destroy
  acts_as_gmappable
  
  def gmaps4rails_address
    "#{self.address}, #{self.city}, #{self.state} #{self.zip}, USA"
  end
  
  def gmaps4rails_infowindow
    # add here whatever html content you desire, it will be displayed when users clicks on the marker
    "<h2>#{self.name}</h2>#{self.address}, #{self.city}, #{self.state} #{self.zip}"
  end
  
  def gmaps4rails_title
    # add here whatever text you desire
    self.name
  end
  
  def gmaps4rails_sidebar
    "<span>#{self.name}</span>"
  end
end
