class FiguresController < ApplicationController
  # add controller methods

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
  # <%@landmarks.each do |landmark|%>
  #   <input id="landmark_<%=landmark.id%>" type="checkbox" name="figure[landmark_ids][]" value="<%=landmark.id%>"><%=landmark.name%> <%='checked' if @figure.landmarks.include?(title)%>/>
  #   <%end%>

  post '/figures' do
    

    @figure = Figure.new(params[:figure])
    # binding.pry
    @landmark = Landmark.create(params[:landmark])
    @title = Title.create(params[:title])
    @figure.landmarks << @landmark
    @figure.titles << @title
    @figure.save
    # binding.pry
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
