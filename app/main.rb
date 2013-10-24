require_relative 'models/congressperson.rb'

# DISPLAY NAMES OF ALL IL REPS
target_state = "IL"

il_reps = Congressperson.where(:state => target_state, :title => "Rep").order("lastname")

puts "Representatives:"
il_reps.each do |rep|
  puts "#{rep.firstname} #{rep.middlename} #{rep.lastname} (#{rep.party})"
end

puts

# DISPLAY NAMES OF ALL IL SENATORS

il_senators = Congressperson.where(:state => target_state, :title => "Sen").order("lastname")

puts "Senators:"
il_senators.each do |rep|
  puts "#{rep.firstname} #{rep.middlename} #{rep.lastname} (#{rep.party})"
end

# p il_senators[2].active?

# DISPLAY NUMBER AND PERCENT OF ACTIVE MALE REPS

all_reps = Congressperson.where(:title => "Rep")
# p all_reps.length
all_active_reps = all_reps.find_all { |rep| rep.active? }
# p all_active_reps.length
male_reps = Congressperson.where(:title => "Rep", :gender => "M")
active_male_reps = male_reps.find_all { |rep| rep.active? }
p (active_male_reps.length.to_f / all_active_reps.length.to_f) * 100

# DISPLAY NUMBER AND PERCENT OF ACTIVE MALE SENATORS

all_senators = Congressperson.where(:title => "Sen")
# p all_reps.length
all_active_senators = all_senators.find_all { |sen| sen.active? }
# p all_active_senators.length
male_senators = Congressperson.where(:title => "Sen", :gender => "M")
active_male_senators = male_senators.find_all { |sen| sen.active? }
p (active_male_senators.length.to_f / all_active_senators.length.to_f) * 100

# DISPLAY NUMBER OF SENATORS AND REPS BY STATE

all_active_grouped_by_state = Congressperson.all.where(:in_office => "1").group("state").count.sort_by { |k, v| v*-1 }#.find_all { |cp| sen.active? }
all_active_grouped_by_state.each do |state_count_pair|
  puts "#{state_count_pair[0]}: 2 Senators, #{state_count_pair[1]-2} Representatives"
end

# DISPLAY TOTAL NUMBER OF SENATORS AND REPS
puts "Total Senators: #{all_senators.count}"

puts "Total Reps: #{all_reps.count}"

# DISPLAY TOTAL NUMBER OF ACTIVE SENATORS AND REPS
puts "Total Active Senators: #{all_active_senators.count}"

puts "Total Active Reps: #{all_active_reps.count}"

