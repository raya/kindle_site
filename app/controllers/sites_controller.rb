class SitesController < ApplicationController
  def show
    @test = Site.find(params[:id])
    @test.process_site
  end
end
