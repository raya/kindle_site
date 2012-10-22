class RenameSiteTable < ActiveRecord::Migration
  def change
    rename_table :site_args, :sites
  end
end

