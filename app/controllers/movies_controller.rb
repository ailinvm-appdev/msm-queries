class MoviesController < ApplicationController
  def index
    @list_of_movies = Movie.all
    render({ :template => "movie_templates/index.html.erb"})
  end

  def details
    #params looks like "an_id" => "42"
    @the_id = params.fetch("an_id")
    @movie_of_interest = Movie.where({ :id => @the_id }).at(0)
    render({ :template => "movie_templates/show.html.erb"})
  end
end
