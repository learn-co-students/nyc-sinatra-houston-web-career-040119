class LandmarksController < ApplicationController
  # add controller methods

  #Read Landmarks
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  #Read the form to create a new Landmark
  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    Landmark.create(params[:landmark])
    redirect '/landmarks'
  end

  #Read individiual Landmarks
  get '/landmarks/:id' do
    @landmark = current_landmark
    erb :'landmarks/show'
  end

  #Read edit page for the Landmark
  get '/landmarks/:id/edit' do
    @landmark = current_landmark
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    landmark = current_landmark
    landmark.update(params[:landmark])
    redirect "/landmarks/#{landmark.id}"
  end

  #Common Querys
  def current_landmark
    Landmark.find(params[:id])
  end

end
