class AddColsToSiteArg < ActiveRecord::Migration
  def change
    add_column :site_args, :status, :string
    add_column :site_args, :link_list, :text
    add_column :site_args, :content, :text
  end
end
