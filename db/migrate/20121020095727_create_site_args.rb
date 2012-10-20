class CreateSiteArgs < ActiveRecord::Migration
  def change
    create_table :site_args do |t|
      t.string :url
      t.integer :max_entries
      t.string :next_post
      t.string :post_matcher
      t.integer :starting_page
      t.integer :starting_page_inc
      t.string :filename

      t.timestamps
    end
  end
end
