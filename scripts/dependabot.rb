#!/usr/bin/env ruby

####################################################################################
# USAGE:
#
# dependabot.rb [ review | checkout ] \
#     (gh pr list --author app/dependabot --json number | jq 'map(.number) | .[]')
####################################################################################

action, *pull_numbers = *ARGV

case action
when "review"
  pull_numbers.each do |pull_number|
    system("gh pr diff #{pull_number}")
    print "Approve this? "
    confirm = STDIN.gets.chomp

    if confirm == "yes"
      system("gh pr review #{pull_number} --approve")
    else
      puts "Skipping…"
      next
    end
  end
when "checkout"
  pull_number = pull_numbers.first
  system("gh pr checkout #{pull_number}")
end
