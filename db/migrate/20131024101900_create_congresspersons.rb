require_relative '../config'

class CreateCongresspersons < ActiveRecord::Migration

  def change
    # HINT: checkout ActiveRecord::Migration.create_table

    create_table :congresspersons do |column|
      column.string :title
      column.string :first_name
      column.string :middle_name
      column.string :last_name
      column.string :name_suffix
      column.string :nickname
      column.string :party
      column.string :state
      column.integer :district
      column.binary :in_office
      column.string :gender
      column.integer :phone
      column.integer :fax
      column.string :website
      column.string :webform
      column.string :congress_office
      column.string :bioguide_id
      column.integer :votesmart_id
      column.string :fec_id
      column.integer :govtrack_id
      column.string :crp_id
      column.string :twitter_id
      column.string :congresspedia_url
      column.string :youtube_url
      column.string :facebook_id
      column.string :official_rss
      column.string :senate_class
      column.date :birthdate
      column.timestamps
    end

  end

end