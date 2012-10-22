class EbooksController < ApplicationController
  def new
    @ebook = Ebook.new
    @ebook.site_arg = SiteArg.new

  end

  def create
    @ebook = Ebook.new(params[:ebook])
    if @ebook.save
      redirect_to :root, notice: "URL successfully submitted."
    else
      render 'new'
    end
  end

  def index
    @ebooks = Ebook.all
  end
end
