get '/login' do
  erb :'auth/login'
end

post '/login' do

end

get '/signup' do
  erb :'auth/signup'
end

post '/signup' do
  user = User.create(params[:user])

  if user.save
    session[:user_id] = user.id
    redirect "/"
  else
    redirect "/signup"
  end
end

get '/signout' do

end