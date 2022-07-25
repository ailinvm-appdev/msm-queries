class ActorsController < ApplicationController
  def index
    @list_of_actors = Actor.all
    render({ :template => "actor_templates/index.html.erb"})
  end

  def details
    #params looks like "an_id" => "42"
    @the_id = params.fetch("an_id")
    @actor_of_interest = Actor.where({ :id => @the_id }).at(0)
    @actor_id = @actor_of_interest.id
    @the_character_rows = Character.where({ :actor_id => @actor_id })
    @movie_id_array = @the_character_rows.map_relation_to_array(:movie_id)
    @the_movies = Movie.all.where({ :id => @movie_id_array })
 
    @director_of_interest = Director.where({ :id => @the_id }).at(0)
    
   # @filmography = Movie.where({ :director_id => @director_of_interest.id })
    render({ :template => "actor_templates/show.html.erb"})
  end
end 
