class QuestionsController < ApplicationController
  def question_1
    # How many movies are in the database?

    # Your Ruby goes here.

    @number_of_movies = Movie.count
  end

  def question_2
    # In what year was the oldest movie on the list released?

    # Your Ruby goes here.

    @year_of_oldest_movie = Movie.order('year DESC').last.year

  end

  def question_3
    # How many movies does the director of the first movie have on the list?

    # Your Ruby goes here.

    # first_movie_director = Director.first.id
    # first_movie_director = Movie.first.director_id

    count_movies_by_director = Movie.where({:director_id => Director.first.id}).count

    @number_of_movies_directed_by_first_movie_director = count_movies_by_director

  end

  def question_4
    # What is the most number of movies any single director has on the list?

    # Your Ruby goes here.
    # You'll probably have to use both ActiveRecord query methods as well as some plain old Ruby logic.

    group_directors = Movie.group(:director_id).count

    order_group = group_directors.values.max

    @most_number_of_movies_by_a_single_director = order_group
  end

  def question_5
    # What is the most recent movie on the list that the first actor appeared in?

    # Your Ruby goes here.
    # You'll probably have to use both ActiveRecord query methods as well as some plain old Ruby logic.

    actor = Actor.first.id

    actors_movies = Role.where({:actor_id => actor}).pluck(:movie_id)

    list_movies = Movie.find(actors_movies)

    sort_list = list_movies.sort_by { |y| y["year"] }

    @most_recent_movie_for_first_actor = sort_list.last.title
  end
end
