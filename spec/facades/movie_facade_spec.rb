require 'rails_helper'

RSpec.describe MovieFacade do 
  it "gets data for top rated movies", :vcr do
    movies = MovieFacade.create_top_movies 
    # require 'pry'; binding.pry 
    expect(movies[0]).to be_a Movie 
    expect(movies.count).to eq(40)
    expect(movies[1].title).to eq("The Shawshank Redemption")
    # expect(movies[0][:vote_average]).to be_a(Float)
  end
  it "gets data for search", :vcr do
    movies = MovieFacade.movie_search("Impossible Things")

    expect(movies[0]).to be_a Movie 
    expect(movies.count).to eq(2)
    expect(movies[1].title).to eq("Impossible Things")
  end
  # it "gets data for cast", :vcr do
  #   movies = MovieFacade.create_cast("Impossible Things")

  #   expect(movies[0]).to be_a Movie 
  #   expect(movies.count).to eq(2)
  #   expect(movies[1].cast).to eq("Impossible Things")
  # end
end