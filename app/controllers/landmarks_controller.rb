class LandmarksController < ApplicationController
  # add controller methods
  # allows you to view form to create a new landmark (FAILED - 11)
  # allows you to create a new landmark (FAILED - 12)
  # allows you to list all landmarks (FAILED - 13)
  # allows you to see a single landmark (FAILED - 14)
  # allows you to view the form to edit a single landmark (FAILED - 15)
  # allows you to edit a single landmark (FAILED - 16)


  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do

    Landmark.create(params[:landmark])

    redirect "/landmarks"
  end

def current_landmark
  Landmark.find(params[:id])
end

  get '/landmarks/:id' do
    @landmark = current_landmark
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = current_landmark
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    current_landmark.update(params[:landmark])

    redirect "/landmarks/#{current_landmark.id}"
  end

end
