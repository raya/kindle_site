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

require 'spec_helper'

describe SiteArg do
  pending "add some examples to (or delete) #{__FILE__}"
end
