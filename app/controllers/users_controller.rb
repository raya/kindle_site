class UsersController < ApplicationController
  require 'Trog_Scraper'

  def new
    #test = TrogScraper.new("google.com")
    test = TrogScraper::HtmlGenerator.random_filename
  end
end
