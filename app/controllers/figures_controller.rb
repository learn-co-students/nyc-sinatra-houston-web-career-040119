class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  #Read the form to create a new Figure
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.new(params[:figure])
    @landmark = Landmark.create(params[:landmark])
    @title = Title.create(params[:title])
    @figure.landmarks << @landmark
    @figure.titles << @title
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  #Read a single instance of a Figure
  get '/figures/:id' do
    @figure = current_figure
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = current_figure
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    Figure.find(params[:id]).update(params[:figure])
    erb :"figures/#{params[:id]}"
  end

  #Common Querys
  def current_figure
    Figure.find(params[:id])
  end

end
