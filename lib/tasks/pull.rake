require 'news-api'

SOURCES = ['abc-news','ars-technica','associated-press','bbc-news','bbc-sport',
           'bloomberg','business-insider','buzzfeed','cbs-news','cnbc','cnn',
           'financial-times','fortune','fox-news','medical-news-today','msnbc',
           'national-geographic','nbc-news','newsweek','new-york-magazine',
           'politico', 'recode','reuters','techcrunch','the-economist',
           'the-new-york-times', 'the-telegraph','the-wall-street-journal',
           'the-washington-post','time','wired']
SOURCE_STRING = SOURCES.join(',')

desc "Pulls articles from News API"
task :pull => :environment do
        newsapi = News.new(Rails.application.secrets.news_api_key)
        all_articles = newsapi.get_everything(sources: SOURCE_STRING, language: 'en', pageSize: 100)
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