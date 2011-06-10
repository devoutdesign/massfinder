class IndexController < ApplicationController
  def index
    @json = Parish.all.to_gmaps4rails
    render :layout => false
  end  
end
