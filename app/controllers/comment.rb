# Index
get '/comment/all' do

end

# New Comment
get '/comment/new' do
  erb :'comment/new'
end

post '/comment' do
  #Comment.create(title: params[:title], content: params[:content])
  comment = Comment.create(params[:comment])
  redirect ("/comment/#{comment.id}")
end

# Existing Comment
get '/comment/:id' do |id|
  @comment = Comment.find(id)
  erb :'comment/show'
end

get '/comment/:id/edit' do |id|
  @comment = Comment.find(id)
  erb :'comment/edit'
end

put '/comment/:id' do |id|

end

delete '/comment/:id' do |id|

end