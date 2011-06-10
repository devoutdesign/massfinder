class MassesController < ApplicationController
  # GET /masses
  # GET /masses.xml
  def index
    @masses = Mass.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @masses }
    end
  end

  # GET /masses/1
  # GET /masses/1.xml
  def show
    @mass = Mass.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mass }
    end
  end

  # GET /masses/new
  # GET /masses/new.xml
  def new
    @mass = Mass.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mass }
    end
  end

  # GET /masses/1/edit
  def edit
    @mass = Mass.find(params[:id])
  end

  # POST /masses
  # POST /masses.xml
  def create
    @mass = Mass.new(params[:mass])

    respond_to do |format|
      if @mass.save
        format.html { redirect_to(@mass, :notice => 'Mass was successfully created.') }
        format.xml  { render :xml => @mass, :status => :created, :location => @mass }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mass.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /masses/1
  # PUT /masses/1.xml
  def update
    @mass = Mass.find(params[:id])

    respond_to do |format|
      if @mass.update_attributes(params[:mass])
        format.html { redirect_to(@mass, :notice => 'Mass was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mass.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /masses/1
  # DELETE /masses/1.xml
  def destroy
    @mass = Mass.find(params[:id])
    @mass.destroy

    respond_to do |format|
      format.html { redirect_to(masses_url) }
      format.xml  { head :ok }
    end
  end
end
