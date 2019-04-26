class FiguresController < ApplicationController
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end
  get '/figures/:id/edit' do
    @figure = current_figure
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end
  get '/figures/:id' do
    @figure = current_figure
    erb :'figures/show'
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
  patch '/figures/:id' do
    current_figure.update(params[:figure])
    if !params[:landmark][:name].is_empty
      current_figure.landmarks << Landmark.create(params[:landmark])
    end
    redirect :"figures/#{current_figure.id}"
  end
  def current_figure
    Figure.find(params[:id])
  end
end
