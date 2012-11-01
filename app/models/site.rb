# == Schema Information
#
# Table name: sites
#
#  id                :integer          not null, primary key
#  url               :string(255)
#  max_entries       :integer
#  next_post         :string(255)
#  post_matcher      :string(255)
#  starting_page     :integer
#  starting_page_inc :integer
#  filename          :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  ebook_id          :integer
#  status            :string(255)
#  link_list         :text
#  content           :text
#  search_type       :string(255)
#

require 'open-uri'

class Site < ActiveRecord::Base
  
  belongs_to :ebook
  attr_accessible :max_entries, :next_post, :post_matcher, :starting_page,
    :starting_page_inc, :url, :search_type

  serialize :link_list, Array

  SEARCH_TYPES = ["CSS", "URL"]
  validates :search_type, presence: true, inclusion: { in: SEARCH_TYPES }
  validates :url, presence: true
  validates :max_entries, presence: true, numericality: { only_integer: true }, length: { minimum: 1 }
  validates :next_post, presence: true
  validates :post_matcher, presence: true
  validates :starting_page, presence: true, numericality: { only_integer: true }
  validates :starting_page_inc, presence: true, numericality: { only_integer: true }

  def open_page(current_url)
    doc = Nokogiri::HTML(open(current_url))
    #TODO if fail, update site table with status of failed
  end

  def process_site
    logger.debug "Running process site"
    @link_list = Array.new
    current_url = self.url 
    while post_limit_not_hit?
      process_page(current_url)
      current_url = get_next_page_url(current_url)
    end
    @link_list
  end

  def process_page(current_url)
    logger.debug "Running process page"
    logger.debug "Opening current_url #{current_url}"
    current_page = open_page(current_url)
    links = current_page.css(self.post_matcher).map do |link|
      @link_list << link['href'].to_s
      break if post_limit_hit?
    end 
    update_attribute(:link_list, @link_list)
  end

  def get_next_page_url(current_page)
    if search_via_css?
      page = open_page(current_page)
      next_page = page.css(self.next_post)[0]['href']
    else
      #not working
      addtl_url = addtl_url + self.starting_page_inc
      next_page = self.url + "/" + self.next_post + addtl_url.to_s
    end
  end

  def search_via_css?
    self.search_type == "CSS" 
  end

  def post_limit_hit?
    @link_list.length >= self.max_entries
  end

  def post_limit_not_hit?
    !post_limit_hit?
  end

end
