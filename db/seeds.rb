(1..10).each do |num|
  Article.create(title: num.to_s, url: "http://zencephalon.com")
end