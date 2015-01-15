# Index
get '/comment/all' do
  @comments = Comment.all
  erb :'comment/index'
end

post '/comment' do
  params[:comment][:user] = current_user
  comment = Comment.create(params[:comment])
  redirect ("/article/#{comment.article_id}")
end

# Existing Comment
get '/comment/:id' do |id|
  @comment = Comment.find(id)
  erb :'comment/show', locals: {comment: @comment}
end

get '/comment/:id/edit' do |id|
  @comment = Comment.find(id)
  erb :'comment/edit'
end

put '/comment/:id' do |id|
  comment = Comment.find(id)
  comment.update(params[:comment])
  redirect ("/comment/#{comment.id}")
end

delete '/comment/:id' do |id|
  Comment.find(id).destroy
  redirect "/comment/all"
end