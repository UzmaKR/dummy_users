
enable :sessions


## same used for url & user 
# get '/' do
#   @user = current_user
#   erb :index
# end

get '/user/register' do
  erb :register_form
end

post '/users' do
    @user = User.new(params[:usermodel])
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect "/user/#{@user.id}"
    else
      erb :register_form
    end
end

get '/user/:id' do
  p params[:id]
  p current_user.id
  ## a user can view only their own page
  if (session[:user_id] && (params[:id].to_i == current_user.id)) 
    @user = User.find(params[:id])
    @urls = get_url_objects_per_userid(params[:id])
    erb :user
  else
    redirect '/'
  end
end

#editing users


