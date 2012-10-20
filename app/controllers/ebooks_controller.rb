class EbooksController < ApplicationController
  def new
    @site_arg = SiteArg.new
  end
end
