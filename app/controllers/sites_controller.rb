class SitesController < ApplicationController
  def show
    @test = Site.find(params[:id])
  end
end
