#User model
# get '/'    for logging in or registering
# get '/user/register', post '/user/:id' for creating an account
# get /user/:id for showing secret page

get '/' do
  # Look in app/views/index.erb
  erb :index
end
