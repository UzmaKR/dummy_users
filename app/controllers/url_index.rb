
get '/' do
  erb :index
end

post '/urls' do
   @url = Url.new(url: params[:url])
   @url.generate_short_url
   @url.click_counter = 0
   if @url.valid?
      @url.save
   end
   erb :index
end

#e.g., /q6bda
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
