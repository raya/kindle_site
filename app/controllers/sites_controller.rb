class SitesController < ApplicationController

  #def show
    #@test = Site.find(params[:id])
    #@test.process_site
  #end

  def show 
    @site = Site.find(params[:id])
    #TrogScraper::HtmlGenerator.create_html_file(@site.link_list)
    TrogScraper::HtmlGenerator.create_html_file(@site.link_list)
  end 
end
