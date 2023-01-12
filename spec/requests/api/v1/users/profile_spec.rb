describe 'GET api/v1/users/:username', type: :request do
  let(:user) { create(:user) }
  let(:username) { user.username }
  let(:donations) { create_list(:donation, 3, beneficiary: user) }
  let(:social_networks) { create(:social_network, user:) }

  context 'when the user is authenticated' do
    let(:auth_headers) { user.create_new_auth_token }

    skip 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    skip 'returns the user' do
      expect(json[:user][:username]).to eq(user.username)
      expect(json[:user][:first_name]).to eq(user.first_name)
      expect(json[:user][:last_name]).to eq(user.last_name)
    end

    context 'when the username is not correct' do
      let(:username) { 'invalid_username' }

      skip 'does not return a successful response' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  context 'when the user is not authenticated' do
    let(:auth_headers) { {} }

    skip 'return a successful response' do
      expect(response).to have_http_status(:success)
    end
  end

  context 'when the user has social networks' do
    skip 'returns the user' do
      expect(json[:user][:social_networks].count).to eq(user.social_networks.count)
    end
  end
end
