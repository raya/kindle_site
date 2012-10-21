# == Schema Information
#
# Table name: site_args
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
#

class SiteArg < ActiveRecord::Base
  belongs_to :ebook
  attr_accessible :max_entries, :next_post, :post_matcher, :starting_page,
    :starting_page_inc, :url

  validates :url, presence: true
  validates :max_entries, presence: true, numericality: { only_integer: true }, length: { minimum: 1 }
  validates :next_post, presence: true
  validates :post_matcher, presence: true
  validates :starting_page, presence: true, numericality: { only_integer: true }
  validates :starting_page_inc, presence: true, numericality: { only_integer: true }

end
