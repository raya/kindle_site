class SitesController < ApplicationController

  def show 
    @site = Site.find(params[:id])
  end 

  def harvest 
    @site = Site.find(params[:id])
    @site.delay(queue: 'links').gather_links
  end

  def create_file
    @site = Site.find(params[:id])
    @site.delay(queue: 'html_files').create_html_file
    redirect_to :root, notice: "HTML file being created"
  end  
end
