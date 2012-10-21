class EbooksController < ApplicationController
  def new
    @site_arg = SiteArg.new
  end

  def create
    @site_arg = Sitearg.new(params[:site_arg])
    if @site_arg.save
      redirect_to :root
    else
      render 'new'
    end
  end
end
