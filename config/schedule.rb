every 5.minutes do
  command "cd /app/wallace/current && bundle exec ruby bin/rapid.rb > log/rapid.log 2>&1"
end

every 1.hour do
  command "cd /app/wallace/current && bundle exec ruby bin/hourly.rb > log/hourly.log 2>&1"
end

every :day, at: '8:10 am' do
  command "cd /app/wallace/current && bundle exec ruby bin/daily.rb > log/daily.log 2>&1"
end

