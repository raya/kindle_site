class SitesController < ApplicationController
  def show
    @test = Site.find(params[:id])
    @page = @test.process_site
  end
end
