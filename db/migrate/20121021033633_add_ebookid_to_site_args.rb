class AddEbookidToSiteArgs < ActiveRecord::Migration
  def change
    add_column :site_args, :ebook_id, :integer
  end
end
