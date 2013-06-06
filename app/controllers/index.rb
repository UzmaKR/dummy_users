#User model
# get '/'    for logging in or registering
# get '/user/register', post '/user/:id' for creating an account
# get /user/:id for showing secret page

get '/' do
  erb :index
end

get '/user/register' do
  erb :register_form
end

post '/users' do
    @user = User.new(params[:usermodel])
    if @user.valid?
      @user.save
      redirect "/user/#{@user.id}"
    else
      erb :register_form
    end
end

get '/user/:id' do
  @user = User.find(params[:id])
  erb :user
end

post '/login' do
  # if User.authenticate(params[:email], params[:password_digest])
    # session
end


