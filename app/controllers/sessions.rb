
enable :sessions

##********************************************
## User login controller functions

# get '/user/register' do
#   erb :register_form
# end

# post '/users' do
#     @user = User.new(params[:usermodel])
#     if @user.valid?
#       @user.save
#       session[:user_id] = @user.id
#       redirect "/user/#{@user.id}"
#     else
#       erb :register_form
#     end
# end

# get '/user/:id' do
#   if session[:user_id]
#     @user = User.find(params[:id])
#     erb :user
#   else
#     redirect '/'
#   end
# end

##editing users
post '/login' do
  if User.authenticate(params[:email], params[:password_digest])
    user_id = User.find_by_email(params[:email]).id
    session[:user_id] = user_id
    redirect "/user/#{user_id}"
  end
end

get '/logout' do
  session.clear
  redirect "/"
end



