require 'rails_helper'

RSpec.describe "user visits the studio show", type: :feature do
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

  describe 'studio show page' do
    it "shows studio's name and location" do
      visit "/studios/#{@lucas.id}"

      expect(page).to have_content("Lucasfilm Ltd")
      expect(page).to have_content("San Francisco")
    end

    it "shows titles of all of its movies" do
      visit "/studios/#{@lucas.id}"

      expect(page).to have_content("The Empire Strikes Back")
      expect(page).to have_content("Return of the Jedi")
    end

    it "shows list of actors in any of the studio's movies" do
      visit "/studios/#{@lucas.id}"

      expect(page).to have_content("Harrison Ford")
      expect(page).to have_content("Mark Hamill")
    end

    it "shows list of actors in any of the studio's movies" do
      visit "/studios/#{@lucas.id}"

      expect(page).to have_content("Harrison Ford")
      expect(page).to have_content("Mark Hamill")
    end

# Story 2  Studio's Actors
# As a user, When I visit a studio show page
# I see a list of actors that have acted in any of the studio's movies
# And I see that the list of actors is unique (no duplicate actors)
# And I see that the list of actors is ordered from oldest actor to youngest
# And I see that the list of actors only includes actors that are currently working
  end
end
