class MapsController < ApplicationController
  def index
    @map = Map.first
    
    @next = Map.offset(1).take
    @prev = Map.last
    @prev = nil if @prev == @map
    
    redirect_to new_map_path if @map.nil?
  end
  
  def show
    @map = Map.find(params[:id])
    
    @next = Map.order('id ASC').where('id > ?', @map.id).first
    @next ||= Map.first
    @prev = Map.order('id DESC').where('id < ?', @map.id).first
    @prev ||= Map.last
  end
  
  def new
    @map = Map.new
  end
  
  def edit
    @map = Map.find(params[:id])
  end
  
  def update
    @map = Map.find(params[:id])
    if @map.update_attributes(map_params)
      flash[:success] = "A new map has been created"
      redirect_to maps_path
    else
      render :edit
    end
  end
  
  def create
    @map = Map.new(map_params)
    
    if @map.save
      flash[:success] = "A new map has been created"
      redirect_to maps_path
    else
      render :new
    end
  end
  
  protected
  
  def map_params
    params.require(:map).permit(:name, :question, :answer, :bounds)
  end
end
