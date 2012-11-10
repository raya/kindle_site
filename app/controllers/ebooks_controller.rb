class EbooksController < ApplicationController
  def new
    @ebook = Ebook.new
    @ebook.site = Site.new

  end

  def create
    @ebook = Ebook.new(params[:ebook])
    if @ebook.save
      @ebook.site.delay(queue: 'links').gather_links
      redirect_to :root, notice: "URL successfully submitted."
    else
      render 'new'
    end
  end

  def index
    @ebooks = Ebook.all
  end

  def download
    @ebook = Ebook.find(params[:id])
    if !@ebook.location.blank?
      #send_file "#{@ebook.location}", :type => 'text/html', :filename => @ebook.location
      send_file "#{@ebook.location}", :type => 'text/html', :filename => @ebook.default_filename 
    end 
  end
end
