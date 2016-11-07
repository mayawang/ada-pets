class PetsController < ApplicationController
  def index
    # search rails render specific attributes with JSON
    # pets = Pet.select(:name, :id, :age)
    pets = Pet.all
    # JSON is JavaScript, can not render ruby object directly in view, which only recogize html&CSS&javascript. Therefore it shows direcly hash, or in another word JSON objects.
    render :json => pets.as_json(:only => [:id, :name, :age, :human]), :status => :ok
    # pets.as_json(:only => [:id, name, :age, :human])
  end

  def show
    # find throw an exception if not found
    pet = Pet.find_by(:id => params[:id])
    if pet
       render :json => pet.as_json(:only => [:id, :name, :age, :human]), :status => :ok
     else
       render :json => [], :status => :no_content
    end
  end

  def search
    pets = Pet.where(:name => params[:query].capitalize)
    if pets
       render :json => pets.as_json(:only => [:id, :name, :age, :human]), :status => :ok
     else
       render :json => [], :status => :no_content
    end
  end

end
