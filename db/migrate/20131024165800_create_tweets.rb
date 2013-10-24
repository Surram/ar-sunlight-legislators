require_relative '../config'

class CreateTweets < ActiveRecord::Migration

  def change
    # HINT: checkout ActiveRecord::Migration.create_table

    create_table :tweets do |column|
      column.string :congressperson_id
      column.integer :tweet_id
      column.string :text
      # execute <<-SQL
      #     ALTER TABLE tweets
      #      ADD CONSTRAINT congressperson_constraint
      #       FOREIGN KEY (congressperson_id) REFERENCES categories(id)
      #   SQL
      # add_foreign_key_constraint(:tweets, :congressperson_id, :congressperson, :id)
      column.timestamps
    end

  end

end