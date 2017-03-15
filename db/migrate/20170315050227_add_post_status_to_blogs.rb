class AddPostStatusToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :status, :integer,  :default => 'true'
  end
end
