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
  end
end
