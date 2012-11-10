# == Schema Information
#
# Table name: ebooks
#
#  id         :integer          not null, primary key
#  location   :string(255)
#  status     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
#
require 'fileutils'
class Ebook < ActiveRecord::Base
  attr_accessible :site_attributes 
  has_one :site
  accepts_nested_attributes_for :site

  STATUS_TYPES = ["SUBMITTED", "COMPLETE", "ERROR"]
  before_create do |ebook|
   self.status = "SUBMITTED"
  end 

  def create_mobi_file
    t = Time.new
    new_filename = "ebook_#{t.strftime("%Y%m%d_%H%M%L")}.mobi"
    new_location = "#{Rails.root}/app/assets/documents/#{new_filename}"
    `#{Settings.kindlegen_path}/kindlegen #{self.site.filename} -o #{new_filename}`
    logger.info "File created. Moving file"
    FileUtils.mv("#{Settings.tmp_path}/#{new_filename}", new_location) 
    logger.info "File moved"
    self.update_attributes({:status => "COMPLETED", :location => new_location }, :without_protection => true)
  end

  def default_filename
    #strip blog so only base_url available
    #remove http and .s
    name = self.site.url
    name.sub!(/^https?:\/\//,'')
    name.sub!(/\./,'-') + '.mobi'
  end
end
