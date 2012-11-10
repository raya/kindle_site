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

class Ebook < ActiveRecord::Base

  attr_accessible :site_attributes 
  has_one :site

  accepts_nested_attributes_for :site
  before_create do |ebook|
   self.status = "SUBMITTED"
  end 

  def create_mobi_file
    logger.info "Creating mobi file"
    logger.info "Puts site filename is #{self.site.filename}"
    puts "Running #{Settings.kindlegen_path}/kindlegen #{self.site.filename}"
    logger.info "Running #{Settings.kindlegen_path}/kindlegen #{self.site.filename}"
    `#{Settings.kindlegen_path}/kindlegen #{self.site.filename}`
    logger.info "Mobi file created."
  end
end
