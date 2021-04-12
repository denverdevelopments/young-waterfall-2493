require 'rails_helper'

RSpec.describe "user visits the movie show", type: :feature do
  before :each do
    @lucas = Studio.create!(name: 'Lucasfilm Ltd', location: 'San Francisco')
    @empire = @lucas.movies.create!(title: 'The Empire Strikes Back', creation_year: 1980, genre: 'Adventure')
    @jedi = @lucas.movies.create!(title: 'Return of the Jedi', creation_year: 1983, genre: 'Adventure')

    @ford = Actor.create!(name: 'Harrison Ford', age: 78, working: false)
    @hamill = Actor.create!(name: 'Mark Hamill', age: 69, working: true)
    @elwes = Actor.create!(name: 'Cary Elwes', age: 58, working: true)

    ActorMovie.create!(actor: @ford, movie: @empire)
    ActorMovie.create!(actor: @hamill, movie: @empire)
  end

  describe 'movie show page' do
    it "shows movie's title, creation year, and genre" do
      visit "/movies/#{@empire.id}"

      expect(page).to have_content("The Empire Strikes Back")
      expect(page).to have_content(1980)
      expect(page).to have_content("Adventure")
    end

    it "shows all of the actors in the movie" do
      visit "/movies/#{@empire.id}"

      expect(page).to have_content("The Empire Strikes Back")
      expect(page).to have_content("Return of the Jedi")
    end

    it "shows list of actors in any of the studio's movies" do
      visit "/studios/#{@lucas.id}"

      expect(page).to have_content("Harrison Ford")
      expect(page).to have_content("Mark Hamill")
    end

    # Story 4  Add an Actor to a Movie
    # As a user, When I visit a movie show page,
    # I do not see any actors listed that are not part of the movie
    # And I see a form to add an actor to this movie
    # When I fill in the form with the name of an actor that exists in the database
    # And I click submit
    # Then I am redirected back to that movie's show page
    # And I see the actor's name is now listed
    #
    # (You do not have to test for any sad path, for example if the name submitted does not match an existing actor)
  end
end
