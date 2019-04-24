class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end

  post '/figures' do
    new_figure = Figure.create(params[:figure])

    if params[:title][:name] != ''
      new_figure.titles << Title.create(params[:title])
    end
    if params[:landmark][:name]
      new_figure.landmarks << Landmark.create(params[:landmark])
    end
    redirect "/figures"
  end

  def current_figure
    Figure.find(params[:id])
  end

  get '/figures/:id' do
    @figure = current_figure
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = current_figure
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    # binding.pry
    figure = current_figure.update(params[:figure])
    if params[:title][:name] != ''
      new_figure.titles << Title.create(params[:title])
    end
    if params[:landmark][:name] !=''
      new_figure.landmarks << Landmark.create(params[:landmark])
    end
    redirect "/figures/#{current_figure.id}"
  end




end
