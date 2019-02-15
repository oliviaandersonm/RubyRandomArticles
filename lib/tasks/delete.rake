


desc "Deletes specified number of articles with rake delete[num] (default 100)"
task :delete, [:num] => :environment do |d, args|
    args.with_defaults(:num => 100)
    num = args.num.to_i
    #delete old records
    first_id = Article.first.id
    articles_to_kill = Article.find((first_id..(first_id + (num - 1))).to_a)
    articles_to_kill.each do |k|
        k.destroy
    end
end