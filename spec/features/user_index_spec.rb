require 'rails_helper'
RSpec.feature 'User Index Page', type: :feature do
    before :each do
        @user = User.create(name: 'Lilly',
                            photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', bio: 'Teacher from Poland.')
        @user2 = User.create(name: 'Tom',
                             photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', bio: 'Teacher from Poland.')
                             

         visit user_path(@user)
    
    end
    it ' displays the username for all users' do
        expect(page).to have_content('Lilly')
    end

    it 'I can see the profile picture for each user' do
        expect(page.find(:css, '.user_page_image')[:src]).to have_content(@user.photo)
    end

    it 'should display the number of posts each user has written.' do
        expect(page).to have_content('Number of posts: 0')
    end

    it " When I click on a user it should redirected to that user's show page" do
        visit(user_path(@user.id))
        expect(page).to have_content('Bio')

    end
end