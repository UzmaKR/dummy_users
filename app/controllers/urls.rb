#listing
get '/' do #listing urls??
  @user = current_user
  erb :index
end

#creating
post '/urls' do
   @url = Url.new(url: params[:url])
   @url.generate_short_url
   @url.click_counter = 0
   if @url.valid?
      @url.user_id = current_user.id if logged_in?
      @url.save
   end
   erb :index
end

#redirecting urls
get '/:short_url' do
  p params[:short_url]
  url_object = Url.find_by_short_url(params[:short_url])
  p url_object
  if url_object  # if short url exists in database
    url_object.click_counter += 1
    url_object.save
    p url_object
    redirect "#{url_object.url}"
  else
    erb :index
  end
end

def get_url_objects_per_userid(id)
  Url.where('user_id = ?', id)
end
