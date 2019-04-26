class LandmarksController < ApplicationController
  get '/landmarks/new' do
    erb :'landmarks/new'
  end
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end
  get '/landmarks/:id' do
    @landmark = current_landmark
    erb :'landmarks/show'
  end
  get '/landmarks/:id/edit' do
    @landmark = current_landmark
    erb :'landmarks/edit'
  end
  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    redirect :"landmarks/#{@landmark.id}"
  end
  patch '/landmarks/:id' do
    current_landmark.update(params[:landmark])
    redirect :"landmarks/#{current_landmark.id}"
  end
  def current_landmark
    Landmark.find(params[:id])
  end
end
