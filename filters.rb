# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  # Your code Here
 @candidates.select{|singleCandidate| singleCandidate[:id] == id}
end

def experienced?(candidate)
  # Your code Here
  if candidate[:years_of_experience] >= 2
    true
  else 
    false
  end
end

def qualified_candidates(candidates)
  # Your code Here
  candidates.select{|singleCandidate| qualified_helper(singleCandidate)} 
end

# More methods will go below

def qualified_helper(singleCandidate)
  if(singleCandidate[:years_of_experience] != 0 && singleCandidate[:github_points] >= 100 && (singleCandidate[:languages].include?("Python") || singleCandidate[:languages].include?("Ruby")) && singleCandidate[:date_applied] >= 15.days.ago.to_date && singleCandidate[:age] > 17)
    true
  else
    false
  end
end


def ordered_by_qualifications(candidates)
  candidates.sort{|a,b|  (a[:years_of_experience] <=> b[:years_of_experience]) == 0 ? a[:github_points] <=> b[:github_points]:a[:years_of_experience] <=> b[:years_of_experience] }.reverse
end