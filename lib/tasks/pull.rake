require 'news-api'

desc "Pulls articles from News API"
task :pull => :environment do
    newsapi = News.new(Rails.application.secrets.news_api_key)
    all_articles = newsapi.get_everything(sources: 'bbc-news', language: 'en')
    all_articles.each do |a|
        a_new = Article.create
        a_new.title = a.title
        a_new.author = a.author
        a_new.source = a.name
        a_new.description = a.description 
        a_new.url = a.url 
        a_new.image = a.urlToImage
        a_new.pub_date = a.publishedAt 
        #a_new.content = a.content
        a_new.save
    end
end