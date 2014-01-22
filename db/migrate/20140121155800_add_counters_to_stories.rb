class AddCountersToStories < ActiveRecord::Migration
  def change

    # Which table, which column to add, which type
    add_column :stories, :votes_count, :integer
    add_column :stories, :comments_count, :integer
    add_column :stories, :is_featured, :boolean, default: false

  end
end
