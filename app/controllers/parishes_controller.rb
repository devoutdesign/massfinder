class ParishesController < ApplicationController
  # GET /parishes
  # GET /parishes.xml
  def index
    @parishes = Parish.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @parishes }
    end
  end

  # GET /parishes/1
  # GET /parishes/1.xml
  def show
    @parish = Parish.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @parish }
    end
  end

  # GET /parishes/new
  # GET /parishes/new.xml
  def new
    @parish = Parish.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @parish }
    end
  end

  # GET /parishes/1/edit
  def edit
    @parish = Parish.find(params[:id])
  end

  # POST /parishes
  # POST /parishes.xml
  def create
    @parish = Parish.new(params[:parish])

    respond_to do |format|
      if @parish.save
        format.html { redirect_to(@parish, :notice => 'Parish was successfully created.') }
        format.xml  { render :xml => @parish, :status => :created, :location => @parish }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @parish.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /parishes/1
  # PUT /parishes/1.xml
  def update
    @parish = Parish.find(params[:id])

    respond_to do |format|
      if @parish.update_attributes(params[:parish])
        format.html { redirect_to(@parish, :notice => 'Parish was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @parish.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /parishes/1
  # DELETE /parishes/1.xml
  def destroy
    @parish = Parish.find(params[:id])
    @parish.destroy

    respond_to do |format|
      format.html { redirect_to(parishes_url) }
      format.xml  { head :ok }
    end
  end
  
  # GET /parishes/1/getlatlong
  def getlatlong
    parish = Parish.find(params[:id])
    address = parish.address + ', ' + parish.city + ', ' + parish.state + ', ' + parish.zip
    require 'rest_client'
    require 'nokogiri'
    response = RestClient.get 'http://maps.googleapis.com/maps/api/geocode/xml', {:params => {:sensor => 'false', :address => address}}    
    doc = Nokogiri::XML(response.body)
    parish.latitude = doc.at_xpath('//GeocodeResponse/result/geometry/location/lat').to_str
    parish.longitude = doc.at_xpath('//GeocodeResponse/result/geometry/location/lng').to_str    
    
    respond_to do |format|
      if parish.save
        format.html { redirect_to(parishes_url, :notice => 'Parish was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(parishes_url, :notice => 'There was an error trying to get the longitude and latitude.') }
        format.xml  { head :unprocessable_entity }
      end
    end
  end
end
