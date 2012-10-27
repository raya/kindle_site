class AddSearchTypetoSites < ActiveRecord::Migration
  def change
    add_column :sites, :search_type, :string
  end 
end
