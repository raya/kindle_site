class RenameSiteArgsToScraper < ActiveRecord::Migration
  def change
    rename_table :site_args, :scraper
  end
end
