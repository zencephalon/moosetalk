# Index
get '/comment/all' do
  @comments = Comment.all
  erb :'comment/index'
end

post '/comment' do
  if current_user
    params[:comment][:user] = current_user
    comment = Comment.new(params[:comment])
    unless comment.save
      parse_ar_errors_for_display!(comment.errors.messages)
    end
  else
    add_error("Please sign in to post a comment.")
  end
  
  redirect ("/article/#{comment.article_id}")
end

# Existing Comment
get '/comment/:id' do |id|
  @comment = Comment.find(id)
  erb :'comment/show', locals: {comment: @comment}
end

get '/comment/:id/edit', auth: :user do |id|
  @comment = Comment.find(id)
  erb :'comment/edit'
end

put '/comment/:id', auth: :user do |id|
  comment = Comment.find(id)
  comment.update(params[:comment])
  redirect ("/comment/#{comment.id}")
end

delete '/comment/:id', auth: :user do |id|
  Comment.find(id).destroy
  redirect "/comment/all"
end