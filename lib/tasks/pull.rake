require 'news-api'

desc "Pulls articles from News API"
task :pull do
    newsapi = News.new(Rails.application.secrets.news_api_key)
    all_articles = newsapi.get_everything(sources: 'bbc-news', page: 1)
    puts all_articles[1].title
end