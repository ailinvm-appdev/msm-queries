

class DirectorsController < ApplicationController

  def index
    @list_of_directors = Director.all
    render({ :template => "director_templates/index.html.erb"})
  end

  def eldest
    @eldest_director = Director.order({ :dob => :asc }).where.not({ :dob =>  nil }).at(0)
    render({ :template => "director_templates/eldest.html.erb"})
  end

  def youngest
    @youngest_director = Director.order({ :dob => :desc }).where.not({ :dob =>  nil }).at(0)
    render({ :template => "director_templates/youngest.html.erb"})
  end
  
  def details
    #params looks like "an_id" => "42"
    @the_id = params.fetch("an_id")
    @director_of_interest = Director.where({ :id => @the_id }).at(0)
    @filmography = Movie.where({ :director_id => @director_of_interest.id })
    render({ :template => "director_templates/show.html.erb"})
  end
end
