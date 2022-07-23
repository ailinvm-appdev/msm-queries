class ActorsController < ApplicationController
  def index
    @list_of_actors = Actor.all
    render({ :template => "actor_templates/index.html.erb"})
  end

  def details
    #params looks like "an_id" => "42"
    @the_id = params.fetch("an_id")
    @actor_of_interest = Actor.where({ :id => @the_id }).at(0)
    @filmography = Movie.where({ :director_id => @director_of_interest.id })
    render({ :template => "actor_templates/show.html.erb"})
  end
end 
