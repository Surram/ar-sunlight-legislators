require_relative '../../db/config'

class Congressperson < ActiveRecord::Base

  def active?
    return true if self.in_office.to_s == "1"

    false
  end

  # def self.get_representatives_by_state(target_state)
  #   self.get_congresspeople_by_state_and_legislature(target_state, "house of representatives")
  # end

  # def self.get_senators_by_state(target_state)
  #   self.get_congresspeople_by_state_and_legislature(target_state, "senate")
  # end

  # def self.get_representatives_by_party(target_party)
  #   self.get_congresspeople_by_party_and_legislature(target_party, "house of representatives")
  # end

  # def self.get_senators_by_party(target_party)
  #   self.get_congresspeople_by_party_and_legislature(target_party, "senate")
  # end

  # private
  # def self.get_congresspeople_by_state_and_legislature(target_state, target_house_of_congress)

  #   if target_house_of_congress == "senate"

  #   elsif target_house_of_congress == house of representatives

  #   else
  #     raise ArgumentError "Invalid house of congress specified"
  #   end

  # end

  # def self.get_congresspeople_by_party_and_legislature(target_party, target_house_of_congress)

  #   if target_house_of_congress == "senate"

  #   elsif target_house_of_congress == house of representatives

  #   else
  #     raise ArgumentError "Invalid house of congress specified"
  #   end

  # end



end