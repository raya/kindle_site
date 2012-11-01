class SitesController < ApplicationController

  def show 
    @site = Site.find(params[:id])
    TrogScraper::HtmlGenerator.create_html_file(@site.link_list)
  end 
end
